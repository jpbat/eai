package system;

import java.util.ArrayList;
import java.util.Properties;
import java.util.Set;
import java.util.concurrent.LinkedBlockingQueue;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import models.Account;
import models.Genre;
import models.Movie;
import services.AccountService;

public class EmailDispatcher implements Runnable {
	
	private Session session;
	private Message message;
	private Thread t;
	
	private String username = "imdbcrawler";
	private String password = "KUctziBCOxkE";
	
	private LinkedBlockingQueue<String[]> pool;
	
	public EmailDispatcher () {
		
		this.pool = new LinkedBlockingQueue<String[]>();
		
		Properties props = new Properties();
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.socketFactory.port", "465");
		props.put("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.port", "465");
		
		this.session = Session.getDefaultInstance(props,
				new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username, password);
			}
		});

		this.message = new MimeMessage(session);
		try {
			this.message.setFrom(new InternetAddress(this.username + "@gmail.com"));
		} catch (MessagingException e) {
		}
		
		System.out.println("HEREEEEEE!!!!");
		
		this.t = new Thread(this);
		this.t.start();
	}
	
	public void run() {
		
		String[] data = null;
		
		while(true) {
			try {
				data = this.pool.take();
				System.out.println("Fetched! Mails on pool: " + this.pool.size());
			} catch (InterruptedException e) {
			}
			
			this.sendMail(data[0], data[1], data[2]);
		}
	}
	
	public void add(String destiny, String subject, String text) {

		if (destiny == null || subject == null || text == null) {
			System.out.println("Error adding");
			return;
		}
		
		String[] data =  {destiny, subject, text};
		
		this.pool.add(data);
	}
	
	private boolean sendMail(String destiny, String subject, String text) {
		
		try {
			this.message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(destiny));
			this.message.setSubject(subject);
			this.message.setText(text);
			Transport.send(message);
				
		} catch (Exception e) {
			System.out.println("Failed to send mail to " + destiny);
			String[] data = {destiny, subject, text};
			this.pool.add(data);
			return false;
			
		}
		System.out.println("Successfuly sent mail to " + destiny);
		return true;
	}
	
	public void sendUpdate(ArrayList<Movie> movies) {
		ArrayList<Account> accounts;
		AccountService as = new AccountService();
		System.out.println("here");
		try {
			accounts = (ArrayList<Account>) as.getAll();
		} catch (Exception e) {
			return;
		}
		
		for (Account acc : accounts) {
			ArrayList<Genre> userFavorites = (ArrayList<Genre>) acc.getFavorites();
			System.out.println("user favorites: " + userFavorites);
			String added = "";
			for (Movie m : movies) {
				Set<Genre> Genres = m.getGenres();
				System.out.println("movie genres: " + Genres);
				for (Genre g1 : userFavorites) {
					for (Genre g2 : Genres) {
						if (g2.getID() == g1.getID()) {
							added += "- " + g2.getName() + "\n";
						}
					}
				}
			}
			added = "Dear " + acc.getName() + "\nThe folowing movies that contain your favorite genres were added:\n" + added;
			
			this.add(acc.getEmail(), "New Movies Added", added);
		}
	}
}