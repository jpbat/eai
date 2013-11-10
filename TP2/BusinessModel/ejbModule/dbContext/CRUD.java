package dbContext;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.PersistenceContextType;
import javax.persistence.Query;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;

public class CRUD<T> implements iCRUD<T>  {

	private Class<T> type;

	@PersistenceContext(unitName="PersistenceHiber", type=PersistenceContextType.EXTENDED)
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
    
	@Override
	public List<T> getAll() throws Exception{
        CriteriaBuilder cb = entityManager.getCriteriaBuilder();
        CriteriaQuery<T> cq = cb.createQuery(type);
        return entityManager.createQuery(cq).getResultList();
    }
	
}
