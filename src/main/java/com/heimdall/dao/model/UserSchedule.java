package com.heimdall.dao.model;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.persistence.AttributeOverride;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;

/**
 * Holds data for user's scheduled shifts. This may need to be modified to use a name string Natural Key. Currently a double query is required.
 * 
 * @author michael
 * 
 */
@Entity
@Table(name = "USER_SCHEDULE")
@AttributeOverride(name = "id", column = @Column(name = "USER_SCHEDULE_ID"))
public class UserSchedule extends BaseModel {

	/**
	 * 
	 */
	private static final long serialVersionUID = -9020899059884163797L;
	private User user;
	private Date startDate;
	private Date endDate;
	private Boolean needsApproval;

	/* Transient */

	@ManyToOne
	@Cascade({ CascadeType.SAVE_UPDATE })
	@JoinColumn(name = "USER")
	public User getUser() {
		return user;
	}

	// @Type(type = "org.jadira.usertype.dateandtime.joda.PersistentDateTime")
	@Column(name = "START_DATE")
	public Date getStartDate() {
		return startDate;
	}

	// @Type(type = "org.jadira.usertype.dateandtime.joda.PersistentDateTime")
	@Column(name = "END_DATE")
	public Date getEndDate() {
		return endDate;
	}

	@Column(name = "NEEDS_APPROVAL")
	public Boolean getNeedsApproval() {
		return needsApproval;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public void setNeedsApproval(Boolean needsApproval) {
		this.needsApproval = needsApproval;
	}

	@Transient
	public String getFormatDateString() {
		if (startDate != null && endDate != null) {
			SimpleDateFormat format = new SimpleDateFormat("EEE, d MMM yyyy HH:mm");
			return "" + format.format(startDate) + " - " + format.format(endDate);
		}
		return "";
	}
}
