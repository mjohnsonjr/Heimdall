package com.heimdall.security;

import java.io.IOException;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;

/**
 * Defines the different pages to redirect the user based on their user level (Spring authority).  That is,
 * a manager will be directed to a different view upon a successful login than a regular user.
 * An Admin will also have a different view presented on successful authentication.  All of these
 * views will also be isolated from each other.  So, the manager cannot access any user views, and vice-versa.
 * 
 * If the case arises that multiple authorities are bound to a user (currently not possible because of the current 
 * database design), the highest user-level will be selected in the list.
 * 
 * @author michael
 *
 */
public class AuthSuccessHandler extends SavedRequestAwareAuthenticationSuccessHandler{
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request,
			HttpServletResponse response, Authentication authentication)
			throws IOException, ServletException {
        
		setAlwaysUseDefaultTargetUrl(false);
		
		Set<String> authList = AuthorityUtils.authorityListToSet(authentication.getAuthorities());
		
		if(authList.contains("ROLE_USER")){
			setDefaultTargetUrl("/User/index");
		}
		
		else if(authList.contains("ROLE_MANAGER")){
			setDefaultTargetUrl("/Manager/index");
		}
		
		else if(authList.contains("ROLE_ADMIN")){
			setDefaultTargetUrl("/Admin/index");
		}
		
		else{
			setDefaultTargetUrl("/");
		}
		
        super.onAuthenticationSuccess(request, response, authentication);	
	}
}
