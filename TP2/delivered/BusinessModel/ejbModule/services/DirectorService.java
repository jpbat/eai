package services;

import java.util.List;

import javax.ejb.Stateless;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Expression;
import javax.persistence.criteria.Root;

import models.Director;
import dbContext.CRUD;

@Stateless
public class DirectorService extends CRUD<Director> {

    public DirectorService() {
        super(Director.class);
    }
	public List<Director> getByName(String name) throws Exception{

        CriteriaBuilder cb = entityManager.getCriteriaBuilder();

        CriteriaQuery<Director> q = cb.createQuery(Director.class);
        Root<Director> c = q.from(Director.class);
        q.select(c);

        Expression<String> path = c.get("Name");

        q.where(cb.like(path, name));
        
        return entityManager.createQuery(q).getResultList();
    }    

}
