package com.heimdall.dao.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.heimdall.dao.UserDao;
import com.heimdall.dao.model.User;
import com.heimdall.dao.service.UserModifyAccountService;


/**This class is responsible for modifying user account information
 * 
 * @author michael, kevin
 *
 */

@Service("userModifyAccountService")  
@Transactional
public class UserModifyAccountServiceImpl implements UserModifyAccountService{
	
	@Autowired
	private UserDao userDao;
	
	@Autowired 
	private PasswordEncoder passwordEncoder;
	
	//orignalUser is completely filled fields, changesUser null fields except those that need changing
	public boolean modifyUser(User originalUser, User changesUser)
	{
		//query db fill a separate User with 
		//user has changes
		if(changesUser.getEnabled() != null)
		{
			originalUser.setEnabled(changesUser.getEnabled());
			userDao.saveOrUpdate(originalUser);
		}
		if(changesUser.getPersonName() != null)
		{
			originalUser.setPersonName(changesUser.getPersonName());
			userDao.saveOrUpdate(originalUser);
		}
		return true;
	}
	public boolean modifyPassword(User user, String newPassword)
	{
		String password = passwordEncoder.encode(newPassword);
		user.setPassword(password);
		userDao.saveOrUpdate(user);
		
		return true;
	}
}
