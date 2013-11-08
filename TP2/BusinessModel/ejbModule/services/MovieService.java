package services;

import java.io.File;

import javax.ejb.ActivationConfigProperty;
import javax.ejb.MessageDriven;
import javax.jms.Connection;
import javax.jms.ConnectionFactory;
import javax.jms.JMSException;
import javax.jms.Message;
import javax.jms.MessageConsumer;
import javax.jms.MessageListener;
import javax.jms.Session;
import javax.jms.TextMessage;
import javax.jms.Topic;
import javax.naming.InitialContext;
import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Unmarshaller;

import DTO.Genres;
import DTO.Movie;
import DTO.MovieList;

@MessageDriven(name = "MessageMDBSample", activationConfig = {
 @ActivationConfigProperty(propertyName = "destinationType", propertyValue = "javax.jms.Topic" ),
 @ActivationConfigProperty(propertyName = "destination", propertyValue = "jms/topic/istp1"),
 @ActivationConfigProperty(propertyName = "clientID", propertyValue = "bean"),
 @ActivationConfigProperty(propertyName = "acknowledgeMode", propertyValue = "Auto-acknowledge"),
 @ActivationConfigProperty(propertyName = "subscriptionDurability", propertyValue = "Durable")})
public class MovieService implements MessageListener{

    public MovieService() {
    }
    
	@Override
	public void onMessage(Message arg0) {
		MovieList movieLst =null;
		TextMessage tm = (TextMessage) arg0;
	    try {
	    	movieLst=getMovieList(tm.getText());
	    } catch (JMSException e) {
	        e.printStackTrace();
	    }
	    for(Movie movie:movieLst.getMovie()){
	    	movie.getDescription();
	    	movie.getDirector();
	    	movie.getDuration();
	    	movie.getImage();
	    	movie.getName();
	    	movie.getScore();
	    	movie.getLaunchDate();
	    	for(String genre:movie.getGenres().getGenre()){
	    		
	    	}
	    	for(String star:movie.getStars().getStar()){
	    		
	    	}
	    	
	    }
	    
	    
	}
	
	private MovieList getMovieList(String xmlFile) {
		MovieList ml = null;
		
		System.out.println(xmlFile);
		
		try {
			JAXBContext jc = JAXBContext.newInstance(MovieList.class);
			Unmarshaller u = jc.createUnmarshaller();
			ml = (MovieList)u.unmarshal( new File(xmlFile) );
		} catch (JAXBException e) {
			//this.logger.log(Logger.unmarshall);
		}
		
		return ml;
	}
	
}
