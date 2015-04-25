package com.heimdall.dao.model;

import javax.persistence.AttributeOverride;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;

/**
 * 
 * @author michael
 * 
 */

@Entity
@Table(name = "USER_COUNT")
@AttributeOverride(name = "id", column = @Column(name = "USER_COUNT_ID"))
public class UserCount extends BaseModel {

	private static final long serialVersionUID = 7082348957263231410L;

	private User user;
	private Integer tradeCount;

	@ManyToOne
	@Cascade({ CascadeType.SAVE_UPDATE })
	@JoinColumn(name = "USER")
	public User getUser() {
		return user;
	}

	@Column(name = "TRADE_COUNT")
	public Integer getTradeCount() {
		return tradeCount;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public void setTradeCount(Integer tradeCount) {
		this.tradeCount = tradeCount;
	}
}
