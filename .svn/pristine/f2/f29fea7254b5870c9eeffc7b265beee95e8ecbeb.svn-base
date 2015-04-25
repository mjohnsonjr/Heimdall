package com.heimdall.controller.role;

import java.security.Principal;
import java.util.LinkedList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.heimdall.controller.BaseController;
import com.heimdall.dao.UserDao;
import com.heimdall.dao.model.User;

@Controller
@RequestMapping("/Admin/**")
public class AdminController extends BaseController{

	@Autowired
	UserDao  userDao;	
	
	@Secured("ROLE_ADMIN")
	@RequestMapping(value="/Admin/index", method = RequestMethod.GET)
	public String printIndexAdmin(ModelMap model, Principal principal) {
 
		String name = principal.getName(); /* User name */
		model.addAttribute("username", name);
		model.addAttribute("message", "Form example");
		
		log.debug("Authenticated ADMIN \"" + name + "\" successfully.");
		
		return "/Admin/index.jsp";
	}
	//Home Page Content
	@Secured("ROLE_ADMIN")
	@RequestMapping(value="/Admin/content/home", method = RequestMethod.GET)
	public String printAjaxHomeAdmin(ModelMap model, Principal principal) {
 
		String name = principal.getName(); /* User name */
		model.addAttribute("username", name);
		
		return "/Admin/content/home.jsp";
	}
	//Personal Account Options
	@Transactional
	@Secured("ROLE_ADMIN")
	@RequestMapping(value="/Admin/content/personalAccountOptions", method = RequestMethod.GET)
	public String printAjaxPersonalAccountOptionsAdmin(ModelMap model, Principal principal){
		
		String name = principal.getName(); /* User name */
		model.addAttribute("username", name);
		
		//User user = userDao.getByNaturalId(name);
		
		/* Pass user ID, to find next 14 shifts for this user */
		//List<UserSchedule> shifts = userScheduleDao.getListByUser(user);
		
		/* List of user shifts */
		//model.addAttribute("shifts", shifts);
		
		return "/Admin/content/personalAccountOptions.jsp";
	}
	
	// All Users Account Options GET
	@Transactional 
	@Secured("ROLE_ADMIN")
	@RequestMapping(value = "/Admin/content/allUsersOptions", method = RequestMethod.GET)
	public String printAjaxEmployeeOptions(ModelMap model, Principal principal, @RequestParam(value = "alert", required = false, defaultValue = "1") String alert) {
		String name = principal.getName();
		model.addAttribute("user", new User());
		List<User> users = userDao.getListofAllUsers();
		List<User> showedUser = new LinkedList<User>();
		
		User currentUser = userDao.getByNaturalId(name);
		// not how it is supposed to work, but it works.
		for (User user : users) {
			if(currentUser.getId() != user.getId())
			{
				showedUser.add(user);
			}	
		}
		model.addAttribute("users", showedUser);
		model.addAttribute("alert", alert);

		return "/Admin/content/allUsersOptions.jsp";
	}
	
	//All users account Options POST (Enables User)	
	@Transactional 
	@Secured("ROLE_ADMIN")
	@RequestMapping(value = "/Admin/content/allUsersOptionsEnable", method = RequestMethod.POST)
	public String printAjaxEmployeeOptionsEnable(ModelMap model, Principal principal, @ModelAttribute("user") User user) { //jsp information into user object
				
		user.setEnabled(true);
				
		if(user.getId() == null || user.getId() == 0){
			return "redirect:/Admin/index?alert=changes_failure";
		}
				
		User realUser = userDao.getById(user.getId()); //User object of user from database

		if (realUser.getEnabled()) 
		{ 
			//notify that the account is already enabled
			return "redirect:/Admin/index?alert=changes_success";				
		}
		else 
		{
			//notify that the account has been enabled
			userModifyAccountService.modifyUser(realUser, user);
			return "redirect:/Admin/index?alert=changes_success"; //redirect attribute (used in js: variable set)
		}
				
	}
	
	// All users account options POST (Disables User) 
	@Transactional
	@Secured("ROLE_ADMIN")
	@RequestMapping(value = "/Admin/content/allUsersOptionsDisable", method = RequestMethod.POST)
	public String printAjaxEmployeeOptionsDisable(ModelMap model, Principal principal, @ModelAttribute("user") User user) { //jsp information into user object
			
		user.setEnabled(false);
			
		/* Check invalid Id */
		if(user.getId() == null || user.getId() == 0){
			return "redirect:/Admin/index?alert=changes_failure";
		}
		User realUser = userDao.getById(user.getId()); //User object of user from database

		if (realUser.getEnabled()) 
		{ 
			//notify that the account has been disabled
			userModifyAccountService.modifyUser(realUser, user);
			return "redirect:/Admin/index?alert=changes_success";				
		}
		else 
		{
			//notify that the account is already disabled
			return "redirect:/Admin/index?alert=changes_success"; //redirect attribute (used in js: variable set)
		}
	}
	
	//All users account options POST (Modify User)
	@Transactional
	@Secured("ROLE_ADMIN") 
	@RequestMapping(value = "/Admin/content/allUsersOptionsModify", method = RequestMethod.POST)
	public String printAjaxEmployeeOptionsModify(ModelMap model, Principal principal, @ModelAttribute("user") User user) { 
	
		/* Queried user */
		if(user.getId() == null || user.getId() == 0){
			return "redirect:/Admin/index?alert=changes_failure";
		}
		User realUser = userDao.getById(user.getId()); 
		
		if(user.getPersonName() != "")
		{
			userModifyAccountService.modifyUser(realUser, user);
		}
		if(user.getPassword() != "") 
		{
			if(user.getPassword().equals(user.getVerifyPassword())) 
			{
				userModifyAccountService.modifyPassword(realUser, user.getPassword());
			}
			else
			{
				return "redirect:/Admin/index?alert=changes_failure"; 
			}
		}

		return "redirect:/Admin/index?alert=changes_success";
	}
	
	
	//Company Account Options
	@Transactional
	@Secured("ROLE_ADMIN")
	@RequestMapping(value="/Admin/content/companyAccountOptions", method = RequestMethod.GET)
	public String printAjaxCompanyAccountOptionsAdmin(ModelMap model, Principal principal){
		
		String name = principal.getName(); /* User name */
		model.addAttribute("username", name);
		
		//User user = userDao.getByNaturalId(name);
		
		/* Pass user ID, to find next 14 shifts for this user */
		//List<UserSchedule> shifts = userScheduleDao.getListByUser(user);
		
		/* List of user shifts */
		//model.addAttribute("shifts", shifts);
		
		return "/Admin/content/companyAccountOptions.jsp";
	}
	
	//Site Status
	@Transactional
	@Secured("ROLE_ADMIN")
	@RequestMapping(value="/Admin/content/siteStatus", method = RequestMethod.GET)
	public String printAjaxSiteStatusAdmin(ModelMap model, Principal principal){
		
		String name = principal.getName(); /* User name */
		model.addAttribute("username", name);
		
		//User user = userDao.getByNaturalId(name);
		
		/* Pass user ID, to find next 14 shifts for this user */
		//List<UserSchedule> shifts = userScheduleDao.getListByUser(user);
		
		/* List of user shifts */
		//model.addAttribute("shifts", shifts);
		
		return "/Admin/content/siteStatus.jsp";
	}
	
	//Message
	@Transactional
	@Secured("ROLE_ADMIN")
	@RequestMapping(value="/Admin/content/message", method = RequestMethod.GET)
	public String printAjaxMessageAdmin(ModelMap model, Principal principal){
		
		String name = principal.getName(); /* User name */
		model.addAttribute("username", name);
		
		//User user = userDao.getByNaturalId(name);
		
		/* Pass user ID, to find next 14 shifts for this user */
		//List<UserSchedule> shifts = userScheduleDao.getListByUser(user);
		
		/* List of user shifts */
		//model.addAttribute("shifts", shifts);
		
		return "/Admin/content/message.jsp";
	}




}
