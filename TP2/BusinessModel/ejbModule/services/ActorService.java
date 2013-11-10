package services;

import java.util.List;

import javax.ejb.LocalBean;
import javax.ejb.Stateless;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Expression;
import javax.persistence.criteria.ParameterExpression;
import javax.persistence.criteria.Root;

import models.Actor;
import dbContext.CRUD;

/**
 * Session Bean implementation class StarService
 */
@Stateless
@LocalBean
public class ActorService extends CRUD<Actor>{

    public ActorService() {
        super();
    }


	public List<Actor> getByName(String name) throws Exception{
        CriteriaBuilder cb = entityManager.getCriteriaBuilder();

        CriteriaQuery<Actor> q = cb.createQuery(Actor.class);
        Root<Actor> c = q.from(Actor.class);
        q.select(c);

        Expression<String> path = c.get("Name");


        q.where(cb.like(path, name));
        
        return entityManager.createQuery(q).getResultList();
    }
    
    
}
