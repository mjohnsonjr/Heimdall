package com.heimdall.dao;

import com.heimdall.dao.model.User;
import com.heimdall.dao.model.UserTimeKeeper;

public interface UserTimeKeeperDao extends GenericDao<UserTimeKeeper, Long> {
	
	public Double getAllHoursLoggedThisWeek(User user);
	public Double getAllHoursLoggedThisMonth(User user);

}
