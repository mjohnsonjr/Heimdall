package com.heimdall.dao.impl;

import java.util.Calendar;
import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.heimdall.dao.UserTimeKeeperDao;
import com.heimdall.dao.model.User;
import com.heimdall.dao.model.UserTimeKeeper;
/** 
 * 
 * @author michael
 *
 */

@Repository("userTimeKeeperDao")
@Transactional
public class UserTimeKeeperDaoImpl extends GenericDaoImpl<UserTimeKeeper, Long> implements UserTimeKeeperDao{

	public UserTimeKeeperDaoImpl(){
		this.setClazz(UserTimeKeeper.class);
	}

	public Double getAllHoursLoggedThisWeek(User user) {
		
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.DAY_OF_WEEK, Calendar.SUNDAY);
		String hql = "SELECT utk.id FROM UserTimeKeeper AS utk INNER JOIN utk.userSchedule AS us WHERE us.user = " + user.getId() + " AND utk.endDateTime > :currentDate  ORDER BY us.startDate ASC";
		Query query = sessionFactory.getCurrentSession().createQuery(hql); 
		query.setCalendarDate("currentDate", cal);
		log.debug("Execute Query: " + hql);
		
		@SuppressWarnings("unchecked")
		List<Long> result = query.list();
		UserTimeKeeper next;
		double count = 0;
		
		/* Query each shift, and find length of time between END_DATETIME (Timekeeper table)
		 * FINDS ALL ENTRIES ON TABLE, MANAGER MUST DELETE THEM WHEN APPROVED. */
		for(Long timeKeeperId : result){ 
			
			next = (UserTimeKeeper)sessionFactory.getCurrentSession().get(UserTimeKeeper.class, timeKeeperId);
			long ms = next.getEndDateTime().getTime() - next.getUserSchedule().getStartDate().getTime();
			count += (double) ms/(1000*60*60);
		}
		
		return count;
	}

	public Double getAllHoursLoggedThisMonth(User user) {
		
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.DAY_OF_MONTH, 1);
		String hql = "SELECT utk.id FROM UserTimeKeeper AS utk INNER JOIN utk.userSchedule AS us WHERE us.user = " + user.getId() + " AND utk.endDateTime > :currentDate  ORDER BY us.startDate ASC";
		Query query = sessionFactory.getCurrentSession().createQuery(hql); 
		query.setCalendarDate("currentDate", cal);
		log.debug("Execute Query: " + hql);
		
		@SuppressWarnings("unchecked")
		List<Long> result = query.list();
		UserTimeKeeper next;
		double count = 0;
		
		/* Query each shift, and find length of time between END_DATETIME (Timekeeper table)
		 * FINDS ALL ENTRIES ON TABLE, MANAGER MUST DELETE THEM WHEN APPROVED. */
		for(Long timeKeeperId : result){ 
			
			next = (UserTimeKeeper)sessionFactory.getCurrentSession().get(UserTimeKeeper.class, timeKeeperId);
			long ms = next.getEndDateTime().getTime() - next.getUserSchedule().getStartDate().getTime();
			count += (double) ms/(1000*60*60);
		}
		
		return count;
	}
}
