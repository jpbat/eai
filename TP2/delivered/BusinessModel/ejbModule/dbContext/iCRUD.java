package dbContext;

import java.util.List;

public interface iCRUD<T> {
	public void add(T obj) throws Exception;
	public void update(T obj) throws Exception;
	public void delete(T obj) throws Exception;
	public List<T> getAll(String... orderBy) throws Exception;
	public T getById(long id) throws Exception;
}
