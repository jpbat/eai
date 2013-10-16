import java.io.IOException;
import java.io.StringReader;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;

import javax.jms.Connection;
import javax.jms.ConnectionFactory;
import javax.jms.JMSException;
import javax.jms.MessageConsumer;
import javax.jms.Session;
import javax.jms.TextMessage;
import javax.jms.Topic;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Unmarshaller;

public class StatsProducer {

	private ConnectionFactory cf;
	private Connection c;
	private Session s;
	private Topic t;
	private MessageConsumer mc;
	private ArrayList<Movie> top;
	private Logger logger;
	private int N = 3;
	InitialContext init;
	public StatsProducer() throws IOException {
		this.logger = new Logger("Stats Producer");
		this.top = new ArrayList<>();
	}

	private boolean connect() {
		try {
			InitialContext init = new InitialContext();
			this.cf = (ConnectionFactory) init.lookup("jms/RemoteConnectionFactory");
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
		
		if (msg == null) {
			throw new JMSException("Jboss down!");
		}
		
		this.logger.log(Logger.received);
		return msg.getText();
	}
	
	public void close() throws JMSException {
		this.c.close();
	}
	
	private ArrayList<Movie> toArrayList(String xml) {
	
		MovieList ml = null;
				
		JAXBContext jaxbContext;
		try {
			jaxbContext = JAXBContext.newInstance(MovieList.class);
			Unmarshaller unmarshaller = jaxbContext.createUnmarshaller();

			StringReader reader = new StringReader(xml);
			ml = (MovieList) unmarshaller.unmarshal(reader);
		
		} catch (JAXBException e) {
			this.logger.log(Logger.unmarshall);
			return null;
		}

		return new ArrayList<>(ml.movie);
	}
	
	private void display() {
		System.out.println("####################################");
		System.out.println("##              Top" + this.N);
		System.out.println("##");
		
		for (int i = 0; i < this.top.size(); i++) {
			String score = this.top.get(i).getScore() == -1 ? "not available" : String.valueOf(this.top.get(i).getScore()).substring(0,3);
			System.out.println("## " + (i+1) + ". " + this.top.get(i).getName() + " - (" + score + ")");	
		}
	}
	
	private int min(int a, int b) {
		return a < b ? a : b;
	}
	
	private void updateTop(String msg) {
		ArrayList<Movie> recent = toArrayList(msg);
		int i, j;
		
		if (recent == null) {
			this.display();
			return;
		}

		for (i = 0; i < this.top.size(); i++) {
			for (j = 0; j < recent.size(); j++) {
				 if(recent.get(j).getName().equals(top.get(i).getName())) {
					 break;
				 }
			}
			if (j == recent.size())
				recent.add(this.top.get(i));
		}
		
		Collections.sort(recent, new Comparator<Movie>() {
			public int compare(Movie o1, Movie o2) {
				return (int) ((o2.getScore() - o1.getScore()) * 10);
			}
		});
		
		this.top.clear();
		
		for (i = 0; i < min(this.N, recent.size()); i++) {
			this.top.add(recent.get(i));
		}
		
		this.display();
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
				this.shutdown();
				break;
			}
			
			if (msg.equals("shutdown")) {
				this.shutdown();
				return;
			}
			
			this.updateTop(msg);
		}
	}
	
	public static void main(String[] args) {
		
		StatsProducer stats = null;
		
		try {
			stats = new StatsProducer();
		} catch (IOException e) {
			System.out.println(Logger.logFileError);
		}
		
		if (stats != null)
			stats.worker();
	}
}
