package services;

import java.io.File;
import java.io.StringReader;
import java.util.ArrayList;
import java.util.List;

import javax.ejb.ActivationConfigProperty;
import javax.ejb.EJB;
import javax.ejb.LocalBean;
import javax.ejb.MessageDriven;
import javax.ejb.Stateful;
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
import javax.xml.stream.XMLInputFactory;
import javax.xml.stream.XMLStreamException;
import javax.xml.stream.XMLStreamReader;

import models.Actor;
import models.Director;
import models.Genre;
import DTO.Genres;
import DTO.Movie;
import DTO.MovieList;


@MessageDriven(name = "MovieManagerBin", activationConfig = {
 @ActivationConfigProperty(propertyName = "destinationType", propertyValue = "javax.jms.Topic" ),
 @ActivationConfigProperty(propertyName = "destination", propertyValue = "jms/topic/istp1"),
 @ActivationConfigProperty(propertyName = "clientID", propertyValue = "bean"),
 @ActivationConfigProperty(propertyName = "acknowledgeMode", propertyValue = "Auto-acknowledge"),
 @ActivationConfigProperty(propertyName = "subscriptionDurability", propertyValue = "Durable")})
public class MovieManagerService implements MessageListener{
	
	@EJB
	private MovieService movieService;
	@EJB
	private GenreService genreService;
	@EJB
	private ActorService actorService;
	@EJB
	private DirectorService directorService;	
	
	
    public MovieManagerService() {
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

	    	models.Movie newMovie = new models.Movie();

	    	System.out.println(movie.getName());
	    	
	    	newMovie.setDescription(movie.getDescription());
	    	String director = movie.getDirector();

    		try {
    			
    			List<models.Director> directorObj = directorService.getByName(director);
    			System.out.print(director+"-"); System.out.println(directorObj.size());
    			if(directorObj.isEmpty()){
    				directorService.add(new Director(director));
    			}else{
    				directorObj.get(0);
    			}
    			
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}	    	
	    	
	    	
	    	newMovie.setDuration(movie.getDuration());
	    	newMovie.setImage(movie.getImage());
	    	newMovie.setTitle(movie.getName());
	    	newMovie.setMetascore(movie.getScore());
	    	newMovie.setLaunchDate(movie.getLaunchDate());
	    	System.out.println("Genero");
	    	ArrayList<models.Genre> genres = new ArrayList<Genre>();
	    	for(String nameGenre:movie.getGenres().getGenre()){
	    		try {
	    			
	    			List<models.Genre> genre = genreService.getByName(nameGenre);
	    			System.out.print(nameGenre+"-"); System.out.println(genre.size());
	    			if(genre.isEmpty()){
	    				genreService.add(new Genre(nameGenre));
	    			}else{
	    				genres.add(genre.get(0));
	    			}
	    			
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
	    		
	    	}
	    	System.out.println("Stars");
	    	ArrayList<models.Actor> actors = new ArrayList<Actor>();
	    	for(String star:movie.getStars().getStar()){
	    		try {
	    			
	    			List<models.Actor> actor = actorService.getByName(star);
	    			System.out.print(star+"-"); System.out.println(actor.size());
	    			if(actor.isEmpty()){
	    				actorService.add(new Actor(star));
	    			}else{
	    				actors.add(actor.get(0));
	    			}
	    			
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
	    	}
	    	
	    	try {
				//movieService.add(newMovie);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	    	
	    }
	    
	}
	
	private MovieList getMovieList(String xmlFile) {
		MovieList ml = null;
		XMLStreamReader xmlReader;
		StringReader reader = new StringReader(xmlFile);
		
		try {
			XMLInputFactory factory = XMLInputFactory.newInstance();
			xmlReader = factory.createXMLStreamReader(reader);
			JAXBContext jc = JAXBContext.newInstance(MovieList.class);
			Unmarshaller u = jc.createUnmarshaller();
			ml = (MovieList)u.unmarshal( xmlReader );
		} catch (JAXBException e) 
		{
			e.printStackTrace();
			//this.logger.log(Logger.unmarshall);
		} catch (XMLStreamException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return ml;
	}
	
}