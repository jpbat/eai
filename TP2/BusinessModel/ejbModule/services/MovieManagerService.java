package services;

import java.io.StringReader;
import java.util.ArrayList;
import java.util.List;

import javax.ejb.ActivationConfigProperty;
import javax.ejb.EJB;
import javax.ejb.MessageDriven;
import javax.jms.JMSException;
import javax.jms.Message;
import javax.jms.MessageListener;
import javax.jms.TextMessage;
import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Unmarshaller;
import javax.xml.stream.XMLInputFactory;
import javax.xml.stream.XMLStreamException;
import javax.xml.stream.XMLStreamReader;

import system.EmailDispatcher;
import models.Actor;
import models.Director;
import models.Genre;
import models.Movie;
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
	private ActorService actorService;
	@EJB
	private DirectorService directorService;
	@EJB
	private GenreService genreService;
	
	private EmailDispatcher emailDispatcher;
	
    public MovieManagerService() {
    	//TODO
    	//emailDispatcher = new EmailDispatcher();
    }
    
	@Override
	public void onMessage(Message arg0) {
		
		MovieList movieLst =null;
		
		TextMessage tm = (TextMessage) arg0;
		
		ArrayList<Movie> addedMovies = new ArrayList<Movie>();
		
	    try {
	    	movieLst=getMovieList(tm.getText());
	    } catch (JMSException e) {
			System.out.println("Erro Retriving XML");
			System.out.println(e.getMessage());
	    }
		
	    for(DTO.Movie movie:movieLst.getMovie()){
	    	
			ArrayList<models.Director> directors = new ArrayList<Director>();
			ArrayList<models.Genre> genres = new ArrayList<Genre>();
			ArrayList<models.Actor> actors = new ArrayList<Actor>();
	    	
	    	String director = movie.getDirector();
    		try {			
    			List<models.Director> directorObj = directorService.getByName(director);
    			if(directorObj.isEmpty()){
    				directorService.add(new Director(director));
    				directorObj = directorService.getByName(director);
    				directors.add(directorObj.get(0));
    			}else{
    				directors.add(directorObj.get(0));
    			}
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}	    	
    		
	    	for(String nameGenre:movie.getGenres().getGenre()){
	    		try {
	    			
	    			List<models.Genre> genre = genreService.getByName(nameGenre);
	    			if(genre.isEmpty()){
	    				genreService.add(new Genre(nameGenre));
	    				genre = genreService.getByName(nameGenre);
	    				genres.add(genre.get(0));
	    			}else{
	    				genres.add(genre.get(0));
	    			}
				} catch (Exception e) {
					System.out.println("Erro Genero");
					System.out.println(e.getMessage());
				}
	    		
	    	}
	    	for(String star:movie.getStars().getStar()){
	    		try {
	    			
	    			List<models.Actor> actor = actorService.getByName(star);
	    			if(actor.isEmpty()){
	    				actorService.add(new Actor(star));
	    				actor = actorService.getByName(star);
	    				actors.add(actor.get(0));
	    			}else{
	    				actors.add(actor.get(0));
	    			}
				} catch (Exception e) {
					System.out.println("Erro actor");
					System.out.println(e.getMessage());
				}
	    	}
	    	
	    	try {
	    		models.Movie newMovie = new models.Movie();
	    		newMovie.setTitle(movie.getName());
	    		newMovie.setDescription(movie.getDescription());
	    		newMovie.setDuration(movie.getDuration());
	    		newMovie.setMetascore(movie.getScore());
	    		newMovie.setImage(movie.getImage());
	    		newMovie.setLaunchDate(movie.getLaunchDate());
	    		newMovie.setActors(actors);
	    		newMovie.setDirectors(directors);
	    		newMovie.setGenres(genres);

    			List<models.Movie> movieobj = movieService.getByTitle(movie.getName());
    			
    			if(movieobj.isEmpty()){
    				movieService.add(newMovie);
    				addedMovies.add(newMovie);
    				
    			}else{
    				newMovie.setID(movieobj.get(0).getID());
    				movieService.update(newMovie);
    			}	    		
	    		
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	    	//TODO
	    	//emailDispatcher.sendUpdate(addedMovies);
	    	System.out.println("Finished storing movie");
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
