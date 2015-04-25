package com.heimdall.security;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.heimdall.dao.UserDao;
import com.heimdall.dao.model.User;

/**
 * Calls to retrieve the user from the database (using hibernate dao), and
 * constructs a new Spring User Object that will be referenced by the Spring
 * security authentication provider (see classpath:security.xml). The
 * authentication provider will determine which views and models the created
 * user has access to.
 * 
 * @author michael
 * 
 */

@Service("userDetailsService")
@Transactional(readOnly = true)
public class UserDetailsServiceImpl implements UserDetailsService {

	@Autowired
	private UserDao userDao;

	public UserDetails loadUserByUsername(String username)
			throws UsernameNotFoundException {

		/* LOAD USER BY PK (email currently) ! */
		User user = userDao.getByNaturalId(username);

		/* Could integrate these into USER table soon */
		boolean accountNonExpired = true;
		boolean credentialsNonExpired = true;
		boolean accountNonLocked = true;

		return new org.springframework.security.core.userdetails.User(
				user.getEmail(), user.getPassword(), user.getEnabled(),
				accountNonExpired, credentialsNonExpired, accountNonLocked,
				getAuthorities(user.getRole().getId()));
	}

	public Collection<? extends GrantedAuthority> getAuthorities(Long role) {
		List<GrantedAuthority> authList = getGrantedAuthorities(getRoles(role));
		return authList;
	}

	public static List<GrantedAuthority> getGrantedAuthorities(
			List<String> roles) {
		List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();

		for (String role : roles) {
			authorities.add(new SimpleGrantedAuthority(role));
		}
		return authorities;
	}

	public List<String> getRoles(Long role) {

		List<String> roles = new ArrayList<String>();

		/* Role 1 = ROLE_ANONYMOUS */

		if (role.intValue() == 2) {
			roles.add("ROLE_USER");
		} else if (role.intValue() == 3) {
			roles.add("ROLE_MANAGER");
		} else if (role.intValue() == 4) {
			roles.add("ROLE_ADMIN");
		}

		return roles;
	}
}
