package models;

import java.io.Serializable;
import java.util.Collection;

import javax.persistence.*;

/**
 * Entity implementation class for Entity: Genre
 *
 */
@Entity
public class Genre implements Serializable {

	private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	private long ID;
    @Column(unique=true)
    private String Name;
	
	@ManyToMany(mappedBy = "Genres")
	private Collection<Movie> Movies;        

	@ManyToMany(mappedBy = "Favorites")
	private Collection<Account> Users;  
	
	public Genre(String name) {
		super();
		Name = name;
	}

	public long getID() {
		return ID;
	}

	public void setID(int iD) {
		ID = iD;
	}

	public String getName() {
		return Name;
	}

	public void setName(String name) {
		Name = name;
	}

	public Collection<Movie> getMovies() {
		return Movies;
	}

	public void setMovies(Collection<Movie> movies) {
		Movies = movies;
	}
	
}
