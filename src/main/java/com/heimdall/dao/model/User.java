package com.heimdall.dao.model;

import javax.persistence.AttributeOverride;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.NaturalId;

/**
 * Hibernate database object that is mapped to the USER table in the MySQL database. Object will be filled when the
 * UserService calls the loadUser(String username) method and queries the connected MySQL database.
 * 
 * @author michael
 * 
 */

@Entity
@Table(name = "USER")
@AttributeOverride(name = "id", column = @Column(name = "USER_ID"))
public class User extends BaseModel {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1677751796302222334L;
	private UserRole role;
	private String personName; /* Change to more enforced name model object */
	private String email;
	private String password;
	private Boolean enabled;

	/* NOT Table Fields (label with @Transient) */
	private String oldPassword;
	private String verifyPassword;
	private String accountType;
	

	public User() {
	}

	/* Used for constructing new users to save. */
	public User(String email, String password, String personName, UserRole userRole, Boolean enabled) {
		this.email = email;
		this.password = password;
		this.personName = personName;
		this.role = userRole;
		this.enabled = enabled;
	}

	@ManyToOne
	@Cascade({ org.hibernate.annotations.CascadeType.SAVE_UPDATE })
	@JoinColumn(name = "ROLE", nullable = false)
	public UserRole getRole() {
		return role;
	}

	@Column(name = "PERSON_NAME", nullable = false)
	public String getPersonName() {
		return personName;
	}

	@NaturalId(mutable = false)
	@Column(name = "EMAIL", unique = true, nullable = false)
	public String getEmail() {
		return email;
	}

	@Column(name = "PASSWORD", nullable = false)
	public String getPassword() {
		return password;
	}

	@Column(name = "ENABLED", nullable = false)
	public Boolean getEnabled() {
		return enabled;
	}

	public void setEnabled(Boolean enabled) {
		this.enabled = enabled;
	}

	public void setRole(UserRole role) {
		this.role = role;
	}

	public void setPersonName(String name) {
		this.personName = name;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Transient
	public String getVerifyPassword() {
		return verifyPassword;
	}

	@Transient
	public String getAccountType() {
		return accountType;
	}

	@Transient
	public String getAccountDescription() {
		return personName + " (" + email + ")";
	}
	
	@Transient
	public String getOldPassword() {
		return oldPassword;
	}

	public void setOldPassword(String oldPassword) {
		this.oldPassword = oldPassword;
	}

	public void setVerifyPassword(String verifyPassword) {
		this.verifyPassword = verifyPassword;
	}

	public void setAccountType(String accountType) {
		this.accountType = accountType;
	}
}
