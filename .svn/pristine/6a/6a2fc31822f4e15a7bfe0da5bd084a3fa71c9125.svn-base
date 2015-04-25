package com.heimdall.dao.model;

import javax.persistence.AttributeOverride;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.NaturalId;

/**
 * Database table that holds all trade requests for shifts.
 * 
 * @author michael
 * 
 */

@Entity
@Table(name = "USER_TRADER")
@AttributeOverride(name = "id", column = @Column(name = "USER_TRADER_ID"))
public class UserTrader extends BaseModel {

	/**
	 * 
	 */
	private static final long serialVersionUID = 6516264151761146628L;

	private User user;
	private UserSchedule userSchedule;
	private Boolean needsApproval;

	@ManyToOne
	@Cascade({ org.hibernate.annotations.CascadeType.SAVE_UPDATE })
	@JoinColumn(name = "USER")
	public User getUser() {
		return user;
	}

	@NaturalId
	@ManyToOne
	@Cascade({ org.hibernate.annotations.CascadeType.SAVE_UPDATE })
	@JoinColumn(name = "USER_SCHEDULE")
	public UserSchedule getUserSchedule() {
		return userSchedule;
	}

	@Column(name = "NEEDS_APPROVAL")
	public Boolean getNeedsApproval() {
		return needsApproval;
	}

	public void setNeedsApproval(Boolean needsApproval) {
		this.needsApproval = needsApproval;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public void setUserSchedule(UserSchedule userSchedule) {
		this.userSchedule = userSchedule;
	}

}
