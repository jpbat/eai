package services;

import java.util.ArrayList;
import java.util.List;

import javax.ejb.LocalBean;
import javax.ejb.Stateless;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Expression;
import javax.persistence.criteria.Root;

import models.Actor;
import models.Director;
import models.Genre;
import dbContext.CRUD;

/**
 * Session Bean implementation class GenreService
 */
@Stateless
public class GenreService extends CRUD<Genre>{

    public GenreService() {
    	super();
    }

	public List<Genre> getByName(String name) throws Exception{

        CriteriaBuilder cb = entityManager.getCriteriaBuilder();

        CriteriaQuery<Genre> q = cb.createQuery(Genre.class);
        Root<Genre> c = q.from(Genre.class);
        q.select(c);

        Expression<String> path = c.get("Name");

        q.where(cb.like(path, name));
        
        return entityManager.createQuery(q).getResultList();
    }    
    
}
