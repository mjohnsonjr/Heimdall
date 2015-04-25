package com.heimdall.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.heimdall.dao.UserDao;
import com.heimdall.dao.model.User;

@Repository("userDao")
@Transactional
public class UserDaoImpl extends GenericDaoImpl<User, String> implements UserDao {

	public UserDaoImpl() {
		this.setClazz(User.class);
	}

	public List<User> getListofUsers() {

		String hql = "SELECT us FROM User AS us INNER JOIN us.role AS ur WHERE ur.role = 'ROLE_USER' ";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		log.debug("Execute Query: " + hql);

		/* List of shift ID's returned from Query. */
		@SuppressWarnings("unchecked")
		List<User> result = query.list();

		log.debug("Query Result: " + result.toArray().toString());
		
		return result;
	}
	public List<User> getListofAllUsers() {

		String hql = "FROM User";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		log.debug("Execute Query: " + hql);

		/* List of shift ID's returned from Query. */
		@SuppressWarnings("unchecked")
		List<User> result = query.list();

		log.debug("Query Result: " + result.toArray().toString());
		
		return result;
	}
}
