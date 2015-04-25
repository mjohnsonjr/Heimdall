package com.heimdall.dao.model;

import java.util.Date;

import javax.persistence.AttributeOverride;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;

/**
 * Table that stores all the employee's logged hours, to be approved by manager.
 * 
 * @author michael
 * 
 */

@Entity
@Table(name = "USER_TIMEKEEPER")
@AttributeOverride(name = "id", column = @Column(name = "USER_TIMEKEEPER_ID"))
public class UserTimeKeeper extends BaseModel {

	private static final long serialVersionUID = -8755373105739225913L;
	private User user;
	private UserSchedule userSchedule;
	private Date endDateTime;
	private Boolean needsApproval;

	@ManyToOne
	@Cascade({ CascadeType.SAVE_UPDATE })
	@JoinColumn(name = "USER")
	public User getUser() {
		return user;
	}

	@ManyToOne
	@Cascade({ CascadeType.ALL })
	@JoinColumn(name = "USER_SCHEDULE")
	public UserSchedule getUserSchedule() {
		return userSchedule;
	}

	@Column(name = "END_DATETIME")
	public Date getEndDateTime() {
		return endDateTime;
	}

	@Column(name = "NEEDS_APPROVAL")
	public Boolean getNeedsApproval() {
		return needsApproval;
	}

	public void setNeedsApproval(Boolean needsApproval) {
		this.needsApproval = needsApproval;
	}

	public void setEndDateTime(Date endDateTime) {
		this.endDateTime = endDateTime;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public void setUserSchedule(UserSchedule userSchedule) {
		this.userSchedule = userSchedule;
	}
}
