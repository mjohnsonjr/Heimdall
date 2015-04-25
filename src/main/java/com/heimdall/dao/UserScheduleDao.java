package com.heimdall.dao;

import java.util.List;

import com.heimdall.dao.model.User;
import com.heimdall.dao.model.UserSchedule;


public interface UserScheduleDao extends GenericDao<UserSchedule, Long>{
	
	public List<UserSchedule> getListByUser(User user);
	public UserSchedule getNextShiftByUser(User user);
	public List<UserSchedule> getShiftsThatNeedApproval();
	public List<UserSchedule> getTradableListByUser(User user);
}
