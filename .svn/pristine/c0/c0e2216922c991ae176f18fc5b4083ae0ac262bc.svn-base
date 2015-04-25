package com.heimdall.dao.model;

import javax.persistence.AttributeOverride;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import org.hibernate.annotations.NaturalId;

/**
 * Mapped Hibernate database table for USER_ROLE, contained rows that consist of all of Timely's different
 * user levels we require.  I would like to make this table a lookup table (read-only).
 *
 */

@Entity
@Table(name = "USER_ROLE")
@AttributeOverride(name="id", column=@Column(name = "USER_ROLE_ID"))
public class UserRole extends BaseModel{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 5962140162164533512L;
	private String role;

	@NaturalId(mutable = false)
	@Column(name = "ROLE", unique = true, nullable = false)
	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}
}
