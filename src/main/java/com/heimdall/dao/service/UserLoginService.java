package com.heimdall.dao.service;

import com.heimdall.dao.model.User;
/**
 * Interface for the UserService (for possible autowiring).
 * 
 */
public interface UserLoginService {

	public User loadUser(String username);
}
