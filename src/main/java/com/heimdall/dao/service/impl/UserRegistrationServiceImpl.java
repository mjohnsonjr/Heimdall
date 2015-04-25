package com.heimdall.dao.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.heimdall.dao.UserDao;
import com.heimdall.dao.UserRoleDao;
import com.heimdall.dao.model.User;
import com.heimdall.dao.model.UserRole;
import com.heimdall.dao.service.UserRegistrationService;


/**
 * This class is responsible for registering new Users.  It will create the User object and save/update
 * it to the MySQL database.  This can also be used to change user data, such as a password, or if the 
 * account is enabled.
 * @author michael
 *
 */
/*TODO: THIS NEEDS MORE SECURITY CHECKS !
 * 		HANDLE USER ALREADY EXISTS */
@Service("userRegistrationService")  
@Transactional
public class UserRegistrationServiceImpl implements UserRegistrationService{

	@Autowired
	private UserDao userDao;
	
	@Autowired
	private UserRoleDao userRoleDao;
	
	@Autowired 
	private PasswordEncoder passwordEncoder;
	
	public boolean registerUser(User user) {
		
		/* Hash password */
		String hashedPassword = passwordEncoder.encode(user.getPassword());
		
		/* Query because Role ID could change if new roles are added */
		UserRole role = userRoleDao.getByNaturalId("ROLE_USER");
		
		user.setPassword(hashedPassword);
		user.setEnabled(true);
		user.setRole(role);
		
		/* Check if user already exists */
		if(userDao.getByNaturalId(user.getEmail()) != null){
			return false;
		}
		
		userDao.save(user);
		return true;
		
	}

	public boolean registerManager(User user) {
		
		/* Hash password */
		String hashedPassword = passwordEncoder.encode(user.getPassword());
		
		UserRole role = userRoleDao.getByNaturalId("ROLE_MANAGER");
		
		user.setPassword(hashedPassword);
		user.setEnabled(true);
		user.setRole(role);
	
		/* Check if user already exists */
		if(userDao.getByNaturalId(user.getEmail()) != null){
			return false;
		}
		
		userDao.save(user);
		
		return true;
	}
	
	public boolean registerAdmin(User user) {
		
		/* Hash password */
		String hashedPassword = passwordEncoder.encode(user.getPassword());
		
		UserRole role = userRoleDao.getByNaturalId("ROLE_ADMIN");
		
		user.setPassword(hashedPassword);
		user.setEnabled(true);
		user.setRole(role);

		/* Check if user already exists */
		if(userDao.getByNaturalId(user.getEmail()) != null){
			return false;
		}
		
		userDao.save(user);

		return true;
	}
}
