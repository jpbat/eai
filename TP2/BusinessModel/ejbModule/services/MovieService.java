package services;

import java.util.List;

import javax.ejb.Stateless;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Expression;
import javax.persistence.criteria.Root;

import dbContext.CRUD;
import models.Genre;
import models.Movie;

@Stateless
public class MovieService extends CRUD<Movie> {

	public MovieService() {
		super();
	}

	public List<Movie> getByTitle(String title) throws Exception{
	
	    CriteriaBuilder cb = entityManager.getCriteriaBuilder();
	
	    CriteriaQuery<Movie> q = cb.createQuery(Movie.class);
	    Root<Movie> c = q.from(Movie.class);
	    q.select(c);
	
	    Expression<String> path = c.get("Title");
	
	    q.where(cb.like(path, title));
	    
	    return entityManager.createQuery(q).getResultList();
	}  

	public List<Movie> getByGenre(String genre) throws Exception{
		
	    CriteriaBuilder cb = entityManager.getCriteriaBuilder();
	
	    CriteriaQuery<Movie> q = cb.createQuery(Movie.class);
	    Root<Movie> cm = q.from(Movie.class);
	    Root<Genre> cg = q.from(Genre.class);
	    q.select(cm);
	
	    Expression<String> genreName = cg.get("Name");

	
	    q.where(cb.like(genreName, genre));
	    
	    return entityManager.createQuery(q).getResultList();
	}
	
	
	//TODO implementar pesquisas por metaScore
}
