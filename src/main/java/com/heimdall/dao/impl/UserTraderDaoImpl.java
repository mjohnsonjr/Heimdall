package com.heimdall.dao.impl;

import java.util.Calendar;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.heimdall.dao.UserTraderDao;
import com.heimdall.dao.model.User;
import com.heimdall.dao.model.UserSchedule;
import com.heimdall.dao.model.UserTrader;
/**
 * 
 * @author michael
 *
 */
@Repository("userTraderDao")
@Transactional
public class UserTraderDaoImpl extends GenericDaoImpl<UserTrader, UserSchedule> implements UserTraderDao{

	public UserTraderDaoImpl(){
		this.setClazz(UserTrader.class);
	}
	
	public List<UserTrader> getShiftsThatNeedApproval(){
		
		String hql = "FROM UserTrader AS ut WHERE ut.needsApproval = 1";
		Query query = sessionFactory.getCurrentSession().createQuery(hql); 
		
		log.debug("Execute Query: " + hql);
		
		@SuppressWarnings("unchecked")
		List<UserTrader> needsApproval = query.list();
		return needsApproval;
	}
	
	public List<UserSchedule> getAvailableShiftsForUser(User user) {
		
		/* Find all Schedules that are up for trade */
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.HOUR_OF_DAY, -1);
		
		String hql = "SELECT ut.userSchedule FROM UserTrader AS ut INNER JOIN ut.userSchedule AS us WHERE ut.user != " + user.getId() + " AND us.startDate >= :currentDate ORDER BY us.startDate ASC";
		Query query = sessionFactory.getCurrentSession().createQuery(hql); 
		query.setCalendarDate("currentDate", cal);
		query.setMaxResults(14);
		
		log.debug("Execute Query: " + hql);
		
		@SuppressWarnings("unchecked")
		List<UserSchedule> upForTrade = query.list();
		
		/* Find all schedules that the user has */
		String hql2 = "SELECT us.startDate, us.endDate FROM UserSchedule AS us WHERE us.user = " + user.getId() + " AND us.needsApproval = 0 AND us.endDate >= :currentDate ORDER BY us.startDate ASC";
		Query query2 = sessionFactory.getCurrentSession().createQuery(hql2); 
		query2.setCalendarDate("currentDate", cal);
		query2.setMaxResults(14);
		
		log.debug("Execute Query: " + hql2);
		
		/* List of shift ID's returned from Query. */
		@SuppressWarnings("unchecked")
		List<Object[]> userShifts = query2.list();
		
		/* Find the possible shifts we can take that do not overlap (interval scheduling problem) */	
		/* Checks for overlap, and removes all overlapping shifts */
		//TODO: THIS STILL MIGHT BE INCORRECTLY PICKING SHIFTS
		removeConflictedOptions(upForTrade, userShifts);

		
		return upForTrade;
	}
	
	
	public List<UserSchedule> getUserSchedulesUpForTrade(User user){
		
		String hql = "SELECT ut.userSchedule FROM UserTrader AS ut INNER JOIN ut.userSchedule AS us WHERE us.user = " + user.getId();
		Query query = sessionFactory.getCurrentSession().createQuery(hql); 

		@SuppressWarnings("unchecked")
		List<UserSchedule> userShifts = query.list();
		
		return userShifts;
	}
	

	private void removeConflictedOptions(List<UserSchedule> upForTradeShifts, List<Object[]> currentShifts) {
		
		Long startUp, endUp;
		UserSchedule next;
		List<UserSchedule> toRemove = new LinkedList<UserSchedule>();
		
		for(int i = 0; i < upForTradeShifts.size(); i++){
			next = upForTradeShifts.get(i);
			for(int j = i; j < currentShifts.size(); j++){
				startUp = ((Date)currentShifts.get(j)[0]).getTime();
				endUp = ((Date)currentShifts.get(j)[1]).getTime();
				/* Condition for overlap, remove the potential shift */
				if(next.getStartDate().getTime() < endUp && next.getEndDate().getTime() > startUp){
					toRemove.add(upForTradeShifts.get(i));
					break;
				}
			}
			upForTradeShifts.removeAll(toRemove);
		}
	}
}
