package com.heimdall.dao.impl;

import java.sql.Date;
import java.util.Calendar;
import java.util.List;

import org.hibernate.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.heimdall.dao.UserScheduleDao;
import com.heimdall.dao.UserTraderDao;
import com.heimdall.dao.model.User;
import com.heimdall.dao.model.UserSchedule;

/**
 * Data access for the user shift schedules.
 * 
 * @author michael
 * 
 */
@Repository("userScheduleDao")
@Transactional
public class UserScheduleDaoImpl extends GenericDaoImpl<UserSchedule, Long> implements UserScheduleDao {
	@Autowired
	private UserTraderDao userTraderDao;

	public UserScheduleDaoImpl() {
		this.setClazz(UserSchedule.class);
	}

	/**
	 * Returns a list of ID's for this user (the shifts belonging to them)
	 * 
	 * Returns a MAXIMUM of 14 shifts, in Ascending order.
	 * */
	public List<UserSchedule> getListByUser(User user) {

		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.HOUR_OF_DAY, -1);

		String hql = "FROM UserSchedule AS us WHERE us.user = " + user.getId() + " AND us.needsApproval = 0 AND us.endDate > :currentDate ORDER BY us.startDate ASC";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setCalendarDate("currentDate", cal);
		query.setMaxResults(14);
		log.debug("Execute Query: " + hql);

		/* List of shift's returned from Query. */
		@SuppressWarnings("unchecked")
		List<UserSchedule> result = query.list();

		log.debug("Query Result: " + result.toArray().toString());

		return result;
	}

	public List<UserSchedule> getTradableListByUser(User user) {
		List<UserSchedule> shifts = getListByUser(user);
		List<UserSchedule> name = userTraderDao.getUserSchedulesUpForTrade(user);
		shifts.removeAll(name);
		return shifts;
	}

	public UserSchedule getNextShiftByUser(User user) {
		UserSchedule schedule = new UserSchedule();
		schedule.setStartDate(Date.valueOf("1900-01-01"));
		schedule.setEndDate(Date.valueOf("1900-01-01"));
		schedule.setUser(user);
		List<UserSchedule> schedList = getListByUser(user);

		return schedList.size() != 0 ? schedList.get(0) : schedule;
	}

	/* returns all shifts that have the NEEDS_APPROVAL column marked */
	public List<UserSchedule> getShiftsThatNeedApproval() {

		String hql = "FROM UserSchedule AS us WHERE us.needsApproval = 1 ORDER BY us.startDate ASC";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		// query.setMaxResults(14);
		log.debug("Execute Query: " + hql);

		/* List of shift ID's returned from Query. */
		@SuppressWarnings("unchecked")
		List<UserSchedule> result = query.list();
		return result;
	}
}
