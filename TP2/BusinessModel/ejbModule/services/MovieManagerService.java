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
public class MovieManagerService implements MessageListener{

    public MovieManagerService() {
    }
    
	@Override
	public void onMessage(Message arg0) {
		MovieService movieService = new MovieService();
		MovieList movieLst =null;
		
		
		
		TextMessage tm = (TextMessage) arg0;
	    try {
	    	movieLst=getMovieList(tm.getText());
	    } catch (JMSException e) {
	        e.printStackTrace();
	    }
	    for(Movie movie:movieLst.getMovie()){
	    	
	    	models.Movie newMovie = new models.Movie();
	    	
	    	newMovie.setDescription(movie.getDescription());
	    	movie.getDirector();
	    	newMovie.setDuration(Long.valueOf(movie.getDuration()));
	    	newMovie.setImage(movie.getImage());
	    	newMovie.setTitle(movie.getName());
	    	newMovie.setMetascore(movie.getScore());
	    	newMovie.setLaunchDate(movie.getLaunchDate());
	    	
	    	for(String genre:movie.getGenres().getGenre()){
	    		
	    	}
	    	for(String star:movie.getStars().getStar()){
	    		
	    	}
	    	
	    	try {
				movieService.add(newMovie);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
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
