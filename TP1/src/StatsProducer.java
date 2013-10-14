import java.io.StringReader;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Scanner;

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
	
	private int N;
	
	public StatsProducer(int N) throws NamingException, JMSException {
		InitialContext init = new InitialContext();
		this.cf = (QueueConnectionFactory) init.lookup("jms/RemoteConnectionFactory");
		this.t = (Topic) init.lookup("jms/topic/istp1");
		this.c = this.cf.createConnection("joao", "pedro");
		this.c.setClientID("StatsProducer");
		this.c.start();
		this.s = this.c.createSession(false, Session.AUTO_ACKNOWLEDGE);
		this.mc = s.createDurableSubscriber(this.t, "is_tp1");
		this.top = new ArrayList<>();
		this.N = N;
	}
	
	private String receive() throws JMSException {

		TextMessage msg = (TextMessage) this.mc.receive();
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
		}

		return ml == null ? null : new ArrayList<>(ml.movie);
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
	
	private void worker(String msg) {
		ArrayList<Movie> recent = toArrayList(msg);
		int i, j;
		
		if (recent == null) {
			this.display();
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
		
		display();
	}
	
	public static void main(String[] args) {
		
		System.out.print("What is your N? ");
		Scanner sc = new Scanner(System.in);
		int N = sc.nextInt();
		sc.close();
		
		try {
			StatsProducer stats = new StatsProducer(N);
			System.out.println("Listening for messages...");
			while(true) {
				String msg = stats.receive();
				if (msg.equals("shutdown")) {
					System.out.println("Good bye...");
					stats.close();
					break;
				}
				stats.worker(msg);
			}
			
		} catch (NamingException | JMSException e) {
			e.printStackTrace();
		}
	}
}
