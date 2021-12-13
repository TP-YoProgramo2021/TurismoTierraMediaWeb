package persistence.commons;

import java.util.List;

public interface GenericDAO<T> {

	//metodos genericos de las clases
	public List<T> findAll();
	public int update(T t);
	public int delete(int t);
	
   /*
	*public int countAll();
	*public int insert(T t);
	*
	*/
}