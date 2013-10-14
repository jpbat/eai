import java.io.IOException;
import java.io.StringWriter;
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
import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Marshaller;

public class IMDBCrawler {

	//File paths	
	String logFileName = "../output/log.txt";
	
	//Crawler and movieList
	Crawler c;
	MovieList ml;
	
	//Jboss comm
	private ConnectionFactory cf;
	private Connection conn;
	private Session s;
	private Destination d;
	private MessageProducer mp;
	
	public IMDBCrawler() throws IOException, NamingException, JMSException {
		this.c = new Crawler(this.logFileName);
		this.ml = new MovieList();
		InitialContext init = new InitialContext();
		this.cf = (QueueConnectionFactory) init.lookup("jms/RemoteConnectionFactory");
		this.d = (Destination) init.lookup("jms/topic/istp1");
		this.conn = (Connection) this.cf.createConnection("joao", "pedro");
		this.conn.start();
		this.s = this.conn.createSession(false, Session.AUTO_ACKNOWLEDGE);
		this.mp = this.s.createProducer(this.d);
	}
	
	private void populateClasses() {
		
		StringWriter sw = new StringWriter();
		
		try {
			JAXBContext jaxbContext = JAXBContext.newInstance(MovieList.class);
			
			Marshaller jaxbMarshaller = jaxbContext.createMarshaller();
			jaxbMarshaller.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
			jaxbMarshaller.setProperty("com.sun.xml.internal.bind.xmlHeaders", "<?xml-stylesheet type=\"text/xsl\" href=\"transform.xsl\"?>");
			jaxbMarshaller.marshal(this.ml, sw);
		
		} catch (JAXBException e) {
			try {
				this.c.log("Unable to marshall");
			} catch (IOException e1) {
				System.out.println(Error.logFileError);
			}
			return;
		}
		
		this.sendToWorkers(sw.toString());
	}
	
	private void start(String selected) {

		try {
			this.ml = this.c.get(selected);
			
			if (this.ml == null) {
				return;
			}
			
			populateClasses();
			
		} catch (IOException e) {
			return;
		}
	}
	
	private void sendToWorkers(String msg) {
		TextMessage tm;
		try {
			tm = this.s.createTextMessage(msg);
			this.mp.send(tm);
		} catch (JMSException e) {
		}
	}
	
	private void shutdown() {
		this.sendToWorkers("shutdown");
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
			System.out.println("3. Top 250");
			System.out.println("4. Kill apps");
			System.out.println("");
			System.out.println("0. Exit");
			
			Scanner sc = new Scanner(System.in);
			do {
				choice = sc.nextInt();
			} while (choice > 4 || choice < 0);
			
			switch (choice) {
				case 1:
					selected = "Coming Soon";
					break;
				case 2:
					selected = "In Theaters";
					break;
				case 3:
					selected = "Top 250";
					break;
				case 4:
					shutdown();
					break;
				case 0:
					sc.close();
					return;
				default:
					break;
			}
			if (selected != null)
				this.start(selected);
		}
	}
	
	public static void main(String[] args) {
		
		IMDBCrawler imdb;
		
		try {
			imdb = new IMDBCrawler();
			imdb.mainMenu();
			imdb.conn.close();
			imdb.c.logFile.close();
		} catch (IOException e) {
			System.out.println(Error.logFileError);
		} catch (NamingException | JMSException e) {
			System.out.println(Error.jbossConnection);
		}
	}
}
