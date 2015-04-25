package com.heimdall.dao;

import java.util.List;

import com.heimdall.dao.model.User;
import com.heimdall.dao.model.UserSchedule;
import com.heimdall.dao.model.UserTrader;

public interface UserTraderDao extends GenericDao<UserTrader, UserSchedule>{

	public List<UserTrader> getShiftsThatNeedApproval();
	public List<UserSchedule> getAvailableShiftsForUser(User user);
	public List<UserSchedule> getUserSchedulesUpForTrade(User user);
		
}
