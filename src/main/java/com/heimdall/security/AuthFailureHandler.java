package com.heimdall.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.ExceptionMappingAuthenticationFailureHandler;

public class AuthFailureHandler extends ExceptionMappingAuthenticationFailureHandler{

	@Override
	public void onAuthenticationFailure(HttpServletRequest request,
			HttpServletResponse response, AuthenticationException exception)
			throws IOException, ServletException {
		
		setUseForward(false);
		setDefaultFailureUrl("/loginfailed?error=1");
		
		super.onAuthenticationFailure(request, response, exception);
	}
}
