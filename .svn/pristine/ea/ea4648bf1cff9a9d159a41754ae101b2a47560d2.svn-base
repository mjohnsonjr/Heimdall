package com.heimdall.controller.auth;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.heimdall.controller.BaseController;

@Controller
@RequestMapping("/login**")
public class LoginController extends BaseController{

	@RequestMapping(value="/loginfailed", method = RequestMethod.GET)
	public String loginerror(ModelMap model, @RequestParam(value = "error", required = false, defaultValue = "1") int error) {
		
		log.debug("Login Error Code: {}", error);
		model.addAttribute("error", "login_failed");
		return "redirect:/"; /* Login Failed JSP */
 
	}
	
	@RequestMapping(value="/logout", method = RequestMethod.GET)
	public String logout(ModelMap model) {
		
		return "index.jsp";
	}
	
}
