package com.heimdall.dao.impl;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.heimdall.dao.UserCountDao;
import com.heimdall.dao.model.UserCount;

@Repository("userCountDao")
@Transactional
public class UserCountDaoImpl extends GenericDaoImpl<UserCount, Long> implements UserCountDao{
	
	public UserCountDaoImpl(){
		this.setClazz(UserCount.class);
	}

}
