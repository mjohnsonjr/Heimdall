package com.heimdall.dao.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.heimdall.dao.UserDao;
import com.heimdall.dao.model.User;
import com.heimdall.dao.service.UserLoginService;

/**
 * Service layer of hibernate-mapped USER table.
 * @author michael
 *
 */

@Service("userLoginService") 
@Transactional 
public class UserLoginServiceImpl implements UserLoginService{

	@Autowired
	private UserDao userDao;
	
	
	public User loadUser(String email) {
		/* Querying against the Natural Key */	
		return userDao.getByNaturalId(email);
	}
}
