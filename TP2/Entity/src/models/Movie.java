package models;

import java.io.Serializable;
import java.util.Collection;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
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
    @Column(length=2048) 
	private String Description;
	private String Duration;
	private String Image;
	
	private double Metascore;

	private String LaunchDate;	
	
	@ManyToMany(fetch = FetchType.EAGER)
	private Set<Actor> Actors;
	@ManyToMany(fetch = FetchType.EAGER)
	private Set<Director> Directors;
	@ManyToMany(fetch = FetchType.EAGER)
	private Set<Genre> Genres;

	public Movie() {
		super();
	}
	
	public Movie( String title, String description, String duration,
			String image, double metascore, String launchDate) {
		super();
		Title = title;
		Description = description;
		Duration = duration;
		Image = image;
		Metascore = metascore;
		LaunchDate = launchDate;

	}
	
	public String getLaunchDate() {
		return LaunchDate;
	}

	public void setLaunchDate(String launchDate) {
		LaunchDate = launchDate;
	}

	public String getImage() {
		return Image;
	}

	public void setImage(String image) {
		Image = image;
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

	public String getDuration() {
		return Duration;
	}

	public void setDuration(String duration) {
		Duration = duration;
	}

	public double getMetascore() {
		return Metascore;
	}

	public void setMetascore(double metascore) {
		Metascore = metascore;
	}

	public Set<Actor> getActors() {
		return Actors;
	}

	public void setActors(Set<Actor> actors) {
		Actors = actors;
	}

	public Set<Director> getDirectors() {
		return Directors;
	}

	public void setDirectors(Set<Director> directors) {
		Directors = directors;
	}

	public Set<Genre> getGenres() {
		return Genres;
	}

	public void setGenres(Set<Genre> genres) {
		Genres = genres;
	}
   
}
