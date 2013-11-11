package dbContext;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.PersistenceContextType;
import javax.persistence.Query;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;

import models.Genre;

public class CRUD<T> implements iCRUD<T>  {

	private Class<T> type;

	@PersistenceContext(name="PersistenceHiber")
	protected EntityManager entityManager;
	
	public CRUD(){
	}
	
	@Override
    public void add(T obj) throws Exception{
		entityManager.persist(obj);
    }
	
	@Override
	public void update(T obj) throws Exception{
    	entityManager.merge(obj);
    }
	@Override
	public void delete(T obj) throws Exception{
    	entityManager.remove(obj);
    }
	
	public T getById(long id){
		return entityManager.find(type, id);
	}
    
	@Override
	public List<T> getAll() throws Exception{
        CriteriaBuilder cb = entityManager.getCriteriaBuilder();
        
        CriteriaQuery<T> q = cb.createQuery(type);
        Root<T> c = q.from(type);
        q.select(c);
        
        return entityManager.createQuery(q).getResultList();
    }
	
}
