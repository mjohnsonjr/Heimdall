package com.heimdall.controller.auth;

import java.util.LinkedList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.heimdall.controller.BaseController;
import com.heimdall.dao.model.User;
import com.heimdall.dao.service.UserRegistrationService;

/**
 * @author michael
 * 
 *         Handles all user, manager, admin registrations.
 */
@Controller
@RequestMapping("/register/**")
public class RegistrationController extends BaseController {

	@Autowired
	UserRegistrationService userRegistrationService;

	/* USER REGISTRATION BELOW */
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String addNewContact(ModelMap model, @RequestParam(value = "error", required = false, defaultValue = "1") String error) {

		List<String> roleList = new LinkedList<String>();
		roleList.add("Employee");
		roleList.add("Manager");

		model.addAttribute("user", new User());
		model.addAttribute("roleList", roleList);
		model.addAttribute("error", error);

		return "registrationForm.jsp";
	}

	/*
	 * Can be used to create a new user, or a new manager. Users must still be associated with a company, managers must
	 * start a new company
	 */
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String addNewContact(ModelMap model, @ModelAttribute("user") User user, BindingResult result) {

		boolean successfulRegistration = false;
		boolean allChecks = false;
		
		

		/* TODO: DO NULL CHECKS, PASSWORD CHECK */
		if (user.getPassword().equals(user.getVerifyPassword())) {
			allChecks = true;
		}
		else{
			return "redirect:/register?error=password_match";
		}
		if (allChecks) {
			log.debug("Adding a new " + user.getAccountType() + " : {}", user.getEmail());
			/* ROLE_USER */
			if (user.getAccountType().equals("Employee")) {
				successfulRegistration = userRegistrationService.registerUser(user);
			}
			/* ROLE_MANAGER */
			else if (user.getAccountType().equals("Manager")) {
				successfulRegistration = userRegistrationService.registerManager(user);
			}
		}

		if (successfulRegistration) {
			return "redirect:/?error=registration_success"; 
		} else {
			return "redirect:/register?error=user_exists"; 
		}
	}

}
