package com.heimdall.dao;

import java.io.Serializable;

/**
 * Generic Dao interface that can be used (@Autowired) in a Service class
 * @param <N>
 *
 */

public interface GenericDao<T, NK extends Serializable> {

	public T getById(Long id);
	public T getByNaturalId(NK id);
	public void delete(T obj);
	public void save(T obj);
	public void saveOrUpdate(T obj);
	public void setClazz(Class< T > clazzToSet);
}
