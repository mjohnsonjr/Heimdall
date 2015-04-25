package com.heimdall.dao.impl;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.heimdall.dao.UserRoleDao;
import com.heimdall.dao.model.UserRole;

@Repository("userRoleDao")
@Transactional(readOnly = true)
public class UserRoleDaoImpl extends GenericDaoImpl<UserRole, String> implements UserRoleDao{
	
	public UserRoleDaoImpl(){
		this.setClazz(UserRole.class);
	}
}
