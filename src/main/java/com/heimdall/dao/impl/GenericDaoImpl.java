package com.heimdall.dao.impl;

import java.io.Serializable;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.heimdall.dao.GenericDao;

/**
 * 
 * @author michael
 *
 * @param <M> The Hibernate model Class (User, etc.).
 * @param <PK> The Primary Key type of this table.
 * @param <NK> The Natural Key type of this table.
 */

public class GenericDaoImpl<M, NK extends Serializable> implements GenericDao<M, NK>{
	
	protected static final Logger log = LoggerFactory.getLogger(GenericDaoImpl.class);
	
	@Autowired
	protected SessionFactory sessionFactory;
	
	protected Class<M> clazz;
	
	/* Use dependency injection to set this, needed to determine the instance type */
	public void setClazz(Class<M> clazzToSet){
	      this.clazz = clazzToSet;
	   }
	
	
	protected Session getCurrentSession(){
		return sessionFactory.getCurrentSession();
	}

	public void delete(Object obj) {
		getCurrentSession().delete(obj);
		
	}

	public void save(Object obj) {
		getCurrentSession().save(obj);
		
	}

	public void saveOrUpdate(Object obj) {
		getCurrentSession().saveOrUpdate(obj);
	}

	@SuppressWarnings("unchecked")
	public M getById(Long id) {
		return (M) getCurrentSession().get(clazz, id);
	}

	@SuppressWarnings("unchecked")
	public M getByNaturalId(Serializable id) {
		return (M) getCurrentSession().bySimpleNaturalId(clazz).load(id);
	}
}
