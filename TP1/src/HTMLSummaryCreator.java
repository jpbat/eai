import java.io.IOException;
import java.sql.Timestamp;

import javax.jms.Connection;
import javax.jms.ConnectionFactory;
import javax.jms.JMSException;
import javax.jms.MessageConsumer;
import javax.jms.QueueConnectionFactory;
import javax.jms.Session;
import javax.jms.TextMessage;
import javax.jms.Topic;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerConfigurationException;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;

public class HTMLSummaryCreator {

	private String outputXML = "../output/out";
	private String XSLTransformer = "../output/transform.xsl";
	private String HTMLPage = "../output/IMDBCrawler";
	
	private ConnectionFactory cf;
	private Connection c;
	private Session s;
	private Topic t;
	private MessageConsumer mc;
	private Logger logger;
	
	public HTMLSummaryCreator() throws IOException {
		this.logger = new Logger("HTML Summary Creator");
	}
	
	private boolean connect() {
		try {
			InitialContext init = new InitialContext();
			this.cf = (QueueConnectionFactory) init.lookup("jms/RemoteConnectionFactory");
			this.t = (Topic) init.lookup("jms/topic/istp1");
			this.c = this.cf.createConnection("joao", "pedro");
			this.c.setClientID("HTMLSummaryCreator");
			this.c.start();
			this.s = this.c.createSession(false, Session.AUTO_ACKNOWLEDGE);
			this.mc = s.createDurableSubscriber(this.t, "is_tp1");
		} catch (NamingException | JMSException e) {
			this.logger.log(Logger.jbossConnection);
			return false;
		}
		return true;
	}
	
	private String receive() throws JMSException {

		TextMessage msg = (TextMessage) this.mc.receive();
		return msg.getText();
	}
	
	public void close() throws JMSException {
		this.c.close();
	}
	
	private boolean generateHTML(String timestamp, String xmlFile) {
		
		String html = this.HTMLPage + "_" + timestamp + ".html"; 
		
		TransformerFactory factory = TransformerFactory.newInstance();
		StreamSource xslt = new StreamSource(this.XSLTransformer);
		
		try {
			
			Transformer transformer = factory.newTransformer(xslt);
			StreamSource text = new StreamSource(xmlFile);
			transformer.transform(text, new StreamResult(html));
		
		} catch (TransformerConfigurationException e) {
			return false;
		} catch (TransformerException e) {
			return false;
		}
		return true;
	}
	
	private void generateFiles(String s) {
		
		MyFile out;
		boolean success = true;
		String timestamp = new Timestamp((new java.util.Date()).getTime()).toString();
		String xmlFile = this.outputXML + "_" + timestamp + ".xml";
		
		try {
			out = new MyFile(xmlFile);
			out.writeln(s);
			out.close();
			System.out.println("XML file successfuly generated!");
		} catch (IOException e) {
			success = false;
			System.out.println("Unable to write to .xml and .html files!");
		}
		
		if (success == false) {
			return;
		}
		
		if (this.generateHTML(timestamp, xmlFile)) {
			System.out.println("HTML file successfuly generated!");
		}
	}
	
	private void shutdown() {
		this.logger.log(Logger.shutdown);
		try {
			this.close();
		} catch (JMSException e) {
			this.logger.log(Logger.jbossClose);
		}
		try {
			this.logger.terminate();
		} catch (IOException e) {
			this.logger.log(Logger.logFileError);
		}
	}
	
	private void worker() {

		boolean connected = false;
		String msg = null;
		
		do {
			connected = this.connect();
			try {
				Thread.sleep(5000);
			} catch (InterruptedException e) {
				this.logger.log(Logger.sleep);
			}
		} while (connected == false);
		
		this.logger.log(Logger.listening);
		
		while(true) {
			try {
				msg = this.receive();
			} catch (JMSException e) {
				msg = null;
				this.logger.log(Logger.jbossFetching);
			}
			
			if (msg != null && msg.equals("shutdown")) {
				this.shutdown();
				break;
			}
			
			this.generateFiles(msg);
		}
	}
	
	public static void main(String[] args) {
		
		HTMLSummaryCreator html = null;
		
		try {
			html = new HTMLSummaryCreator();
		} catch (IOException e) {
			System.out.println(Logger.logFileError);
		}
		
		if (html != null)
			html.worker();
	}
}
