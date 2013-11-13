package dbContext;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Order;
import javax.persistence.criteria.Root;

public class CRUD<T> implements iCRUD<T>  {

	private Class<T> Type;

	@PersistenceContext(name="PersistenceHiber")
	protected EntityManager entityManager;
	
	public CRUD(Class<T> type){
		Type = type;
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
	
	@Override
	public T getById(long id){
		return entityManager.find(Type, id);
	}
    
	@Override
	public List<T> getAll(String... orderBy) throws Exception{
        CriteriaBuilder cb = entityManager.getCriteriaBuilder();
        
        CriteriaQuery<T> q = cb.createQuery(Type);
        Root<T> c = q.from(Type);
        q.select(c);
        q.where();
        
	    List<Order> orders = new ArrayList<Order>();
	    
	    if(orderBy.length > 0){
		   
		    for(String order: orderBy){
		    	orders.add(cb.desc(c.get(order)));
		    }
		    q.orderBy(orders);
	    }
        
        
        return entityManager.createQuery(q).getResultList();
    }
	
}
