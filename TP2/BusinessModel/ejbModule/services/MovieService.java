package services;

import javax.ejb.LocalBean;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.PersistenceContextType;

import dbContext.CRUD;
import models.Movie;

@Stateless
@LocalBean
public class MovieService extends CRUD<Movie> {

	public MovieService() {
		super();
	}


}
