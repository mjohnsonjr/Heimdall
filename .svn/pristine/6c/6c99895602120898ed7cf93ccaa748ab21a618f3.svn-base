package com.heimdall.controller;

import java.security.Principal;
import java.util.Collection;

import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.heimdall.dao.UserDao;
import com.heimdall.dao.UserScheduleDao;
import com.heimdall.dao.UserTimeKeeperDao;
import com.heimdall.dao.UserTraderDao;
import com.heimdall.dao.service.UserModifyAccountService;
import com.heimdall.dao.service.UserRegistrationService;

@Controller
@RequestMapping("/") /* Map /* for all unrecognized pages */
public class BaseController {
	
	protected static final Logger log = LoggerFactory.getLogger(BaseController.class);

	protected static final SimpleGrantedAuthority ROLE_USER = new SimpleGrantedAuthority("ROLE_USER");
	protected static final SimpleGrantedAuthority ROLE_MANAGER = new SimpleGrantedAuthority("ROLE_MANAGER");
	protected static final SimpleGrantedAuthority ROLE_ADMIN = new SimpleGrantedAuthority("ROLE_ADMIN");
	
	@Autowired
	protected SessionFactory sessionFactory;

	// Schedule Table Access
	@Autowired
	protected UserScheduleDao userScheduleDao;

	// User Table Access
	@Autowired
	protected UserDao userDao;

	// Time Keeper Table Access
	@Autowired
	protected UserTimeKeeperDao userTimeKeeperDao;

	// Shift Trader Table Access
	@Autowired
	protected UserTraderDao userTraderDao;
	
	@Autowired
	protected UserModifyAccountService userModifyAccountService;
	
	@Autowired
	protected PasswordEncoder passwordEncoder;
	
	@Autowired
	protected UserRegistrationService userRegistrationService;

	
	/* Checks if the user is already authenticated and redirects them to the appropriate view. */
	@RequestMapping(value = "/", method = RequestMethod.GET) 
	public String index(ModelMap model, Principal principal,@RequestParam(value = "error", required = false, defaultValue = "1") String error)
	{
		/* Check if session still active. */
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();

		if (!(auth instanceof AnonymousAuthenticationToken)) {

			/* The user is already logged in, redirect to the designated home screen */
			model.addAttribute("username", principal.getName());
			Collection<? extends GrantedAuthority> roles = auth.getAuthorities();
			
			if(roles.contains(ROLE_ADMIN)){
				return "redirect:/Admin/index";
			}
		    
			else if(roles.contains(ROLE_MANAGER)){
				return "redirect:/Manager/index";
			}
			
			else if(roles.contains(ROLE_USER)){
				return "redirect:/User/index";
			}
		}
		
		model.addAttribute("serverTime", System.currentTimeMillis());
		model.addAttribute("error", error);
		return "index.jsp"; /* Index jsp page, for user with no authorities */
	}
	
	//Careers Page
	@RequestMapping(value="/careers", method = RequestMethod.GET)
	public String printCareers(ModelMap model, Principal principal){
		
		return "careers.jsp";
	}
	
	//About Page
	@RequestMapping(value="/about", method = RequestMethod.GET)
	public String printAbout(ModelMap model, Principal principal){
		
		return "about.jsp";
	}
	//Contact Us Page
	@RequestMapping(value="/contact", method = RequestMethod.GET)
	public String printContact(ModelMap model, Principal principal){
		
		return "contact.jsp";
	}
	//Help Page
	@RequestMapping(value="/help", method = RequestMethod.GET)
	public String printHelp(ModelMap model, Principal principal){
		
		return "help.jsp";
	}
	
}
