import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
import java.io.StringWriter;
import java.sql.Timestamp;
import java.util.Scanner;
import java.util.concurrent.LinkedBlockingQueue;

import javax.jms.Connection;
import javax.jms.ConnectionFactory;
import javax.jms.Destination;
import javax.jms.JMSException;
import javax.jms.MessageProducer;
import javax.jms.QueueConnectionFactory;
import javax.jms.Session;
import javax.jms.TextMessage;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.xml.XMLConstants;
import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Marshaller;
import javax.xml.bind.Unmarshaller;
import javax.xml.transform.stream.StreamSource;
import javax.xml.validation.Schema;
import javax.xml.validation.SchemaFactory;
import javax.xml.validation.Validator;

import org.xml.sax.SAXException;

public class IMDBCrawler implements Runnable {

	//Path to files
	private String xsdFile = "Crawler.xsd";
	private String failedPath = "../failed/";
	
	//Crawler and movieList
	Crawler c;
	MovieList ml;
	
	//Jboss comm
	private ConnectionFactory cf;
	private Connection conn;
	private Session s;
	private Destination d;
	private MessageProducer mp;
	private LinkedBlockingQueue<String> pool;
	private volatile boolean on;
	private Logger logger;
	private Thread t;
	
	public IMDBCrawler() throws IOException{
		this.logger = new Logger("IMDb Crawler");
		this.c = new Crawler(this.logger);
		this.ml = new MovieList();
		this.pool = new LinkedBlockingQueue<>();
		this.on = true;
		this.t = new Thread(this);
		this.t.start();
	}
	
	private boolean connect() {

		InitialContext init;
		try {
			init = new InitialContext();
			this.cf = (QueueConnectionFactory) init.lookup("jms/RemoteConnectionFactory");
			this.d = (Destination) init.lookup("jms/topic/istp1");
			this.conn = (Connection) this.cf.createConnection("joao", "pedro");
			this.conn.start();
			this.s = this.conn.createSession(false, Session.AUTO_ACKNOWLEDGE);
			this.mp = this.s.createProducer(this.d);
		} catch (NamingException | JMSException e) {
			this.logger.log(Logger.jbossConnection);
			return false;
		}
		return true;
	}
	
	public void run() {
		boolean connected = false;
		String data = null;
		
		do {
			connected = connect();
			try {
				Thread.sleep(5000);
			} catch (InterruptedException e) {
				this.logger.log(Logger.sleep);
			}
		} while (connected == false && this.on);
		
		this.logger.log(Logger.jbossConnected);
		
		if (this.on == false) {
			return;
		}
		
		while(this.on) {
			
			try {
				data = this.pool.take();
				this.send(data);
			} catch (InterruptedException e) {
				this.logger.log(Logger.threadKilled);
			}
		}
	}
	
	private void populateClasses() {
		
		StringWriter sw = new StringWriter();
		
		try {
			JAXBContext jaxbContext = JAXBContext.newInstance(MovieList.class);
			
			Marshaller jaxbMarshaller = jaxbContext.createMarshaller();
			jaxbMarshaller.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
			jaxbMarshaller.setProperty("com.sun.xml.internal.bind.xmlHeaders", "<?xml-stylesheet type=\"text/xsl\" href=\"transform.xsl\"?>\n");
			jaxbMarshaller.marshal(this.ml, sw);
		
		} catch (JAXBException e) {
			this.logger.log(Logger.marshall);
			return;
		}
		
		if (this.validateXML(sw.toString())) {
			this.pool.add(sw.toString());
			this.logger.log(Logger.poolSize + this.pool.size());
		}
	}
	
	private void start(String selected) {
			
		this.ml = this.c.get(selected);
		
		if (this.ml == null || this.ml.movie.size() == 0) {
			System.out.println("No movies found!");
			return;
		}
		
		populateClasses();
	}
	
	private void send(String msg) {
		TextMessage tm;
		boolean connected = true;
		
		try {
			if (this.on == false) {
				if (msg.equals("shutdown") == false)
					this.pool.add(msg);
				return;
			}
			tm = this.s.createTextMessage(msg);
			this.mp.send(tm);
			this.logger.log(Logger.poolSize + this.pool.size());
		} catch (JMSException e) {
			this.logger.log(Logger.jbossPublish);
			connected = false;
			do {
				connected = connect();
				try {
					Thread.sleep(5000);
				} catch (InterruptedException e1) {
					if (msg.equals("shutdown") == false)
						this.pool.add(msg);
					this.logger.log(Logger.sleep);
				}
			} while (connected == false && this.on);
		}
	}
	
	private void shutdownApps() {
		this.pool.add("shutdown");
	}
	
	private void mainMenu() {
		
		int choice;
		String selected;
		
		while (true) {
			selected = null;
			
			System.out.println("######################################");
			System.out.println("##           IMDB Crawler           ##");
			System.out.println("######################################\n");
			System.out.println("Wich list do you wish to crawl?");
			System.out.println("1. Coming Soon");
			System.out.println("2. In Theaters");
			System.out.println("3. Tops");
			System.out.println("4. Custom url");
			System.out.println("5. Kill apps");
			System.out.println("");
			System.out.println("0. Exit");
			
			@SuppressWarnings("resource")
			Scanner sc = new Scanner(System.in);
			do {
				choice = sc.nextInt();
			} while (choice > 5 || choice < 0);
			
			switch (choice) {
				case 1:
					selected = "Coming Soon";
					break;
				case 2:
					selected = "In Theaters";
					break;
				case 3:
					selected = "Tops";
					break;
				case 4:
					selected = "custom";
					break;
				case 5:
					shutdownApps();
					break;
				case 0:
					shutdown();
					return;
				default:
					break;
			}
			if (selected != null)
				this.start(selected);
		}
	}
	
	private void shutdown() {
		
		this.on = false;
		
		this.t.interrupt();
		try {
			this.t.join();
		} catch (InterruptedException e) {
			this.logger.log(Logger.threadKilled);
		}
		if (this.pool.size() > 0) {
			System.out.println(this.pool.size() + Logger.poolClosed);
			this.logger.log(this.pool.size() + Logger.poolClosed);
			this.saveQueue();
		}
		try {
			if (this.conn != null)
				this.conn.close();
		} catch (JMSException e) {
			this.logger.log(Logger.jbossClose);
		}
		try {
			this.logger.terminate();
		} catch (IOException e) {
			this.logger.log(Logger.logFileError);
		}
	}
	
	private boolean validateXML(String xml) {

		try {
		    SchemaFactory factory = SchemaFactory.newInstance(XMLConstants.W3C_XML_SCHEMA_NS_URI);
		    Schema schema = factory.newSchema(new StreamSource(xsdFile));
		
		    Validator validator = schema.newValidator();
		    validator.validate(new StreamSource(new ByteArrayInputStream(xml.getBytes())));
		
		} catch(SAXException e) {
			this.logger.log(Logger.xmlInvalid);
			this.logger.log(e.toString());
		    return false;
		} catch (IOException e) {
			this.logger.log(Logger.xsdFile);
			return false;
		}
		
		return true;
	}
	
	private MovieList getMovieList(String xmlFile) {
		MovieList ml = null;
		
		System.out.println(xmlFile);
		
		try {
			JAXBContext jc = JAXBContext.newInstance(MovieList.class);
			Unmarshaller u = jc.createUnmarshaller();
			ml = (MovieList)u.unmarshal( new File(xmlFile) );
		} catch (JAXBException e) {
			this.logger.log(Logger.unmarshall);
		}
		
		return ml;
	}
	
	private void loadQueue() {
		
		File directory  = new File(this.failedPath);
        File[] listOfFiles = directory.listFiles();
        
        for(File file: listOfFiles) {
            if (file.isFile() && file.getName().endsWith(".xml")) {;
        		this.logger.log(file.getName() + Logger.loadingQueue);
        		this.ml = getMovieList(this.failedPath + file.getName());
        		this.populateClasses();
        		this.logger.log(file.getName() + Logger.loadedQueue);
                file.delete();
            }
        }
	}
	
	private void saveQueue() {

		MyFile out;
		String data = null;
		while (this.pool.size() > 0) {
			String timestamp = new Timestamp((new java.util.Date()).getTime()).toString();
			String xmlFile = this.failedPath + "Failed_" + timestamp + ".xml";
			try {
				data = this.pool.take();
			} catch (InterruptedException e1) {
				e1.printStackTrace();
				break;
			}

			if (validateXML(data)) {
				try {
					out = new MyFile(xmlFile);
					out.writeln(data);
					out.close();
					this.logger.log(Logger.successXML);
				} catch (IOException e) {
					this.logger.log(Logger.failedXML);
				}				
			}


		}
	}
	
	public static void main(String[] args) {
		
		IMDBCrawler imdb = null;
		
		try {
			imdb = new IMDBCrawler();
		} catch (IOException e) {
			imdb = null;
			System.out.println(Logger.logFileError);
		}
		
		if (imdb != null) {
			imdb.loadQueue();
			imdb.mainMenu();
		}
	}
}
