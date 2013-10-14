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

public class StatsProducer {

	private ConnectionFactory cf;
	private Connection c;
	private Session s;
	private Topic t;
	private MessageConsumer mc;
	
	public StatsProducer() throws NamingException, JMSException {
		InitialContext init = new InitialContext();
		this.cf = (QueueConnectionFactory) init.lookup("jms/RemoteConnectionFactory");
		this.t = (Topic) init.lookup("jms/topic/istp1");
		this.c = this.cf.createConnection("joao", "pedro");
		this.c.setClientID("StatsProducer");
		this.c.start();
		this.s = this.c.createSession(false, Session.AUTO_ACKNOWLEDGE);
		this.mc = s.createDurableSubscriber(this.t, "is_tp1");
	}
	
	private String receive() throws JMSException {

		TextMessage msg = (TextMessage) this.mc.receive();
		return msg.getText();
	}
	
	public void close() throws JMSException {
		this.c.close();
	}
	
	public static void main(String[] args) {
		
		try {
			StatsProducer stats = new StatsProducer();
			System.out.println("Listening for messages...");
			while(true) {
				String msg = stats.receive();
				if (msg.equals("shutdown")) {
					System.out.println("Good bye...");
					stats.close();
					break;
				}
			}
			
		} catch (NamingException | JMSException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
