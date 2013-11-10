package models;

import java.io.Serializable;
import java.util.Collection;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;

/**
 * Entity implementation class for Entity: Movie
 *
 */
@Entity
public class Movie implements Serializable {

	
	private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	private long ID;
	
    @Column(unique=true)
	private String Title;
	private String Description;
	private String Duration;
	
	private int Metascore;
	private String Buzz;
	
	@ManyToMany
	private Collection<Actor> Actors;
	@ManyToMany
	private Collection<Director> Directors;
	@ManyToMany
	private Collection<Genre> Genres;
	
	public Movie() {
		super();
	}

	public long getID() {
		return ID;
	}

	public void setID(long iD) {
		ID = iD;
	}

	public String getTitle() {
		return Title;
	}

	public void setTitle(String title) {
		Title = title;
	}

	public String getDescription() {
		return Description;
	}

	public void setDescription(String description) {
		Description = description;
	}

	public Long getDuration() {
		return Duration;
	}

	public void setDuration(Long duration) {
		Duration = duration;
	}

	public int getMetascore() {
		return Metascore;
	}

	public void setMetascore(int metascore) {
		Metascore = metascore;
	}

	public String getBuzz() {
		return Buzz;
	}

	public void setBuzz(String buzz) {
		Buzz = buzz;
	}

	public Collection<Actor> getActors() {
		return Actors;
	}

	public void setActors(Collection<Actor> actors) {
		Actors = actors;
	}

	public Collection<Director> getDirectors() {
		return Directors;
	}

	public void setDirectors(Collection<Director> directors) {
		Directors = directors;
	}

	public Collection<Genre> getGenres() {
		return Genres;
	}

	public void setGenres(Collection<Genre> genres) {
		Genres = genres;
	}
   
}
