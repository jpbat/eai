package services;

import javax.ejb.LocalBean;
import javax.ejb.Stateless;

import models.Genre;
import dbContext.CRUD;

/**
 * Session Bean implementation class GenreService
 */
@Stateless
@LocalBean
public class GenreService extends CRUD<Genre>{

    /**
     * Default constructor. 
     */
    public GenreService() {
    	super();
    }

}
