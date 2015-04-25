package com.heimdall.controller.android;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.heimdall.dao.UserDao;
import com.heimdall.dao.model.User;

@Controller
@RequestMapping("/android/**")
public class AndroidLoginController {

	@Autowired
	private UserDao userDao;

	/*
	 * Checks if the user is already authenticated and redirects them to the
	 * appropriate view.
	 */

	@Transactional
	@RequestMapping(value = "/android/log", method = RequestMethod.GET)
	public String index(ModelMap model, Principal principal) {

		model.addAttribute("username", principal.getName());

		User user = userDao.getByNaturalId(principal.getName());

		model.addAttribute("personname", user.getPersonName());
		model.addAttribute("role", user.getRole().getRole());

		return "android";
	}

}