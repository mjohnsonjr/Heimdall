package com.heimdall.controller.role;

import java.security.Principal;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.heimdall.controller.BaseController;
import com.heimdall.dao.model.IDListWrapper;
import com.heimdall.dao.model.IDMapWrapper;
import com.heimdall.dao.model.User;
import com.heimdall.dao.model.UserSchedule;
import com.heimdall.dao.model.UserTrader;

@Controller
@RequestMapping("/Manager/**")
public class ManagerController extends BaseController {



	@Secured("ROLE_MANAGER")
	@RequestMapping(value = "/Manager/index", method = RequestMethod.GET)
	public String printIndexManager(ModelMap model, Principal principal) {

		String name = principal.getName(); /* User name */
		model.addAttribute("username", name);
		model.addAttribute("message", "Form example");

		log.debug("Authenticated MANAGER \"" + name + "\" successfully.");
		return "/Manager/index.jsp";
	}

	// Home Page Content
	@Transactional
	@Secured("ROLE_MANAGER")
	@RequestMapping(value = "/Manager/content/home", method = RequestMethod.GET)
	public String printAjaxShiftTraderContent(ModelMap model, Principal principal) {

		String name = principal.getName(); /* User name */
		model.addAttribute("username", name);
		
		/* Get all trade requests that need manager approval */
		List<UserTrader> tradeRequests = userTraderDao.getShiftsThatNeedApproval();
		model.addAttribute("tradeRequests", tradeRequests.size());

		return "/Manager/content/home.jsp";
	}

	// Employee Account Creation Get
	@Secured("ROLE_MANAGER")
	@RequestMapping(value = "/Manager/content/accountCreation", method = RequestMethod.GET)
	public String printAjaxAccountCreation(ModelMap model, Principal principal, @RequestParam(value = "alert", required = false, defaultValue = "1") String alert) {

		String name = principal.getName(); /* User name */

		List<String> roleList = new LinkedList<String>();
		roleList.add("Employee");
		roleList.add("Manager");

		model.addAttribute("user", new User());
		model.addAttribute("username", name);
		model.addAttribute("roleList", roleList);
		model.addAttribute("alert", alert);

		return "/Manager/content/accountCreation.jsp";
	}

	/*
	 *  Employee Account Creation Post
	 *  Can be used to create a new user, or a new manager. Users must still be associated with a company, managers must start a new company
	 */
	@Secured("ROLE_MANAGER")
	@RequestMapping(value = "/Manager/content/accountCreation", method = RequestMethod.POST)
	public String addNewContact(ModelMap model, @ModelAttribute("user") User user, BindingResult result) {

		boolean successfulRegistration = false;
		boolean allChecks = false;

		if (user.getPassword().equals(user.getVerifyPassword())) {
			allChecks = true;
		}
		else{
			return "redirect:/Manager/index?alert=password_match";
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
			return "redirect:/Manager/index?alert=registration_success";
		}
		// Not sure where to redirect for a error page if login does not work.
		else{
			return "redirect:/Manager/index?alert=user_exists";
		}
	}
	
	// Employee Scheduling Get
	@Transactional
	@Secured("ROLE_MANAGER")
	@RequestMapping(value = "/Manager/content/employeeScheduling", method = RequestMethod.GET)
	public String printAjaxEmployeeScheduling(ModelMap model, Principal principal, @RequestParam(value = "alert", required = false, defaultValue = "1") String alert) {
		// create a UserSchedule Object before hand and give it a Temp User so as to set user Id
		UserSchedule userSchedule = new UserSchedule();
		userSchedule.setUser(new User());
		model.addAttribute("userSchedule", userSchedule);
		
		/* Used to approve employee shift requests */
		model.addAttribute("idMapWrapper", new IDMapWrapper());
		List<UserSchedule> shiftRequests = userScheduleDao.getShiftsThatNeedApproval();
		model.addAttribute("shiftRequests", shiftRequests);
		
		/* Options for radio buttons */
		List<String> options = new LinkedList<String>();
		options.add("Approve");
		options.add("Reject");
		model.addAttribute("options", options);
		
		String name = principal.getName();
		model.addAttribute("username", name);
		
		List<UserSchedule> schedules;
		String scheduleString;
		List<String> scheduleStrings =new ArrayList<String>();
		/* Only finds users with role: USER_ROLE */
		List<User> users = userDao.getListofUsers();
		for(User user: users){
			scheduleString="";
			schedules=userScheduleDao.getListByUser(user);
			for(UserSchedule schedule:schedules)
			{
				scheduleString = scheduleString + schedule.getFormatDateString() + '\n';
			}
			scheduleStrings.add(scheduleString);
		}
		model.addAttribute("users", users);
		model.addAttribute("schedules", scheduleStrings);
		
		//Alert
		model.addAttribute("alert", alert);
		
		return "/Manager/content/employeeScheduling.jsp";
	} 
	
	// Employee Scheduling POST
	@Transactional
	@Secured("ROLE_MANAGER")
	@RequestMapping(value = "/Manager/content/employeeScheduling", method = RequestMethod.POST)
	public String printAjaxEmployeeScheduling(ModelMap model, Principal principal, @ModelAttribute("userSchedule") UserSchedule userSchedule, BindingResult result) {
		// get User Id from Temp object set in get and get full user
		
		if(userSchedule.getUser() == null || userSchedule.getUser().getId() == 0 ||
				userSchedule.getStartDate() == null || userSchedule.getEndDate() == null){
			return "redirect:/Manager/index?alert=no_shift";
		}
		
		User user = userDao.getById(userSchedule.getUser().getId());
		userSchedule.setUser(user);
		userSchedule.setNeedsApproval(false);
		userScheduleDao.save(userSchedule);
		return "redirect:/Manager/index?alert=shift_assigned";
	}
	
	// Employee Scheduling POST (SHIFT PREFERENCE APPROVALS)
	@Transactional
	@Secured("ROLE_MANAGER")
	@RequestMapping(value = "/Manager/content/employeeScheduling2", method = RequestMethod.POST)
	public String printAjaxEmployeeScheduling(ModelMap model, Principal principal, @ModelAttribute("idMapWrapper") IDMapWrapper idMapWrapper, BindingResult result) {
	
		/* Get all shifts selected (radio buttons), and take action.  
		 * Approved: Approve the schedule, just flip the NEEDS_APPROVAL bit 
		 * Denied: Delete from the table. */
		Map<String, String> idListMap = idMapWrapper.getIds();
		UserSchedule shift;
		
		for (String id : idListMap.keySet()) {
			if (idListMap.get(id).equals("Approve")) {
				shift = userScheduleDao.getById(Long.valueOf(id));
				shift.setNeedsApproval(false);
				userScheduleDao.saveOrUpdate(shift);
			}
			/* Delete the schedule, not approved. */
			else {
				shift = userScheduleDao.getById(Long.valueOf(id));
				userScheduleDao.delete(shift);
			}
		}
		
		return "redirect:/Manager/index?alert=shift_assigned";
	}

	// Employee Account Options
	@Transactional 
	@Secured("ROLE_MANAGER")
	@RequestMapping(value = "/Manager/content/employeeOptions", method = RequestMethod.GET)
	public String printAjaxEmployeeOptions(ModelMap model, Principal principal, @RequestParam(value = "alert", required = false, defaultValue = "1") String alert) {
		String name = principal.getName();
		model.addAttribute("user", new User());
		List<User> users = userDao.getListofUsers();
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

		return "/Manager/content/employeeOptions.jsp";
	}
	
	
	// Employee Account Options (Enables Employee)
		@Transactional 
		@Secured("ROLE_MANAGER")
		@RequestMapping(value = "/Manager/content/employeeOptionsEnable", method = RequestMethod.POST)
		public String printAjaxEmployeeOptionsEnable(ModelMap model, Principal principal, @ModelAttribute("user") User user) { //jsp information into user object
			
			user.setEnabled(true);
			
			if(user.getId() == null || user.getId() == 0){
				return "redirect:/Manager/index?alert=password_failed";
			}
			
			User realUser = userDao.getById(user.getId()); //User object of user from database

			if (realUser.getEnabled()) 
			{ 
				//notify that the account is already enabled
				return "redirect:/Manager/index?alert=enable_success";				
			}
			else 
			{
				//notify that the account has been enabled
				userModifyAccountService.modifyUser(realUser, user);
				return "redirect:/Manager/index?alert=enable_success"; //redirect attribute (used in js: variable set)
			}
			
		}
	
	
	// Employee Account Options POST (Disables Employee) */
	@Transactional
	@Secured("ROLE_MANAGER")
	@RequestMapping(value = "/Manager/content/employeeOptionsDisable", method = RequestMethod.POST)
	public String printAjaxEmployeeOptionsDisable(ModelMap model, Principal principal, @ModelAttribute("user") User user) { //jsp information into user object
		
		user.setEnabled(false);
		
		/* Check invalid Id */
		if(user.getId() == null || user.getId() == 0){
			return "redirect:/Manager/index?alert=password_failed";
		}
		User realUser = userDao.getById(user.getId()); //User object of user from database

		if (realUser.getEnabled()) 
		{ 
			//notify that the account has been disabled
			userModifyAccountService.modifyUser(realUser, user);
			return "redirect:/Manager/index?alert=disable_success";				
		}
		else 
		{
			//notify that the account is already disabled
			return "redirect:/Manager/index?alert=disable_success"; //redirect attribute (used in js: variable set)
		}
	}
	
	@Transactional
	@Secured("ROLE_MANAGER") 
	@RequestMapping(value = "/Manager/content/employeeOptionsModify", method = RequestMethod.POST)
	public String printAjaxEmployeeOptionsModify(ModelMap model, Principal principal, @ModelAttribute("user") User user) { //jsp information into user object
	
		/* Queried user */
		if(user.getId() == null || user.getId() == 0){
			return "redirect:/Manager/index?alert=password_failed";
		}
		User realUser = userDao.getById(user.getId()); //User object of user from database	
		
		if(user.getPersonName() != "")
		{
			userModifyAccountService.modifyUser(realUser, user);
		}
		if(user.getPassword() != "") 
		{
			if(user.getPassword().equals(user.getVerifyPassword())) //security password checker
			{
				userModifyAccountService.modifyPassword(realUser, user.getPassword());
			}
			else
			{
				return "redirect:/Manager/index?alert=password_failed"; //redirect attribute (used in js: variable set)
			}
		}

		return "redirect:/Manager/index?alert=changes_success";
	}
	
	


	// Employee Payroll Options
	@Secured("ROLE_MANAGER")
	@RequestMapping(value = "/Manager/content/payrollOptions", method = RequestMethod.GET)
	public String printAjaxPayrollOptions(ModelMap model, Principal principal) {

		String name = principal.getName(); /* User name */
		model.addAttribute("username", name);

		return "/Manager/content/payrollOptions.jsp";
	}

	// Employee Trader Approval GET
	@Secured("ROLE_MANAGER")
	@RequestMapping(value = "/Manager/content/traderApproval", method = RequestMethod.GET)
	public String printAjaxTraderApproval(ModelMap model, Principal principal, @RequestParam(value = "alert", required = false, defaultValue = "1") String alert) {

		String name = principal.getName(); /* User name */
		model.addAttribute("username", name);

		/* POST CommandName */
		IDListWrapper idListWrapper = new IDListWrapper();
		model.addAttribute("idListWrapper", idListWrapper);

		/* Radio button options */
		List<String> options = new LinkedList<String>();
		options.add("Approve");
		options.add("Reject");
		model.addAttribute("options", options);

		/* Map containing states of radio button (String id, and accept or reject) */
		IDMapWrapper idMapWrapper = new IDMapWrapper();
		model.addAttribute("idMapWrapper", idMapWrapper);

		/* Get all trade requests that need manager approval */
		List<UserTrader> tradeRequests = userTraderDao.getShiftsThatNeedApproval();

		model.addAttribute("tradeRequests", tradeRequests);
		model.addAttribute("alert", alert);

		return "/Manager/content/traderApproval.jsp";
	}

	// Employee Trader Approval POST
	@Transactional
	@Secured("ROLE_MANAGER")
	@RequestMapping(value = "/Manager/content/traderApproval", method = RequestMethod.POST)
	public String printAjaxTraderApproval(ModelMap model, Principal principal, @ModelAttribute("idList") IDMapWrapper idList, BindingResult result) {

		String name = principal.getName(); /* User name */
		model.addAttribute("username", name);

		/* POST CommandName */
		model.addAttribute("userTraderForm", new UserTrader());

		/* Approve/reject. shifts. */
		Map<String, String> idListMap = idList.getIds();
		UserTrader trade;
		UserSchedule newSched;
		
		/* Get all shifts selected (radio buttons), and take action */
		for (String id : idListMap.keySet()) {
			if (idListMap.get(id).equals("Approve")) {
				trade = userTraderDao.getById(Long.valueOf(id));
				/*
				 * Get the new user from the trade, modify the schedule with that user as the new holder of that shift
				 */
				newSched = trade.getUserSchedule();
				newSched.setUser(trade.getUser());
				userTraderDao.delete(trade);
				/* Save the new schedule */
				userScheduleDao.saveOrUpdate(newSched);
			}
			/* Delete the trade req, it was rejected. */
			else {
				trade = userTraderDao.getById(Long.valueOf(id));
				userTraderDao.delete(trade);
			}

		}
		log.debug("All selected shifts approved");

		return "redirect:/Manager/index?alert=trades_handled";
	}

	// Manager Account Options Page
	@Secured("ROLE_MANAGER")
	@RequestMapping(value = "/Manager/content/options", method = RequestMethod.GET)
	public String printAjaxOptions(ModelMap model, Principal principal) {

		String name = principal.getName(); /* User name */
		model.addAttribute("username", name);
		
		/* Fill new data, to update user profile */
		User user = new User();
		model.addAttribute("user", user);

		return "/Manager/content/options.jsp";
	}
	
	// Account Options Page
	@Transactional
	@Secured("ROLE_MANAGER")
	@RequestMapping(value = "/Manager/content/options", method = RequestMethod.POST)
	public String printAjaxOptions(ModelMap model, Principal principal, @ModelAttribute("user") User user, BindingResult result) {
	
		String name = principal.getName(); /* User name */
		model.addAttribute("username", name);
		/* User Change password Logic */
		String oldPassword = user.getOldPassword();
		String newPassword = user.getPassword();
		String verifyPassword = user.getVerifyPassword();
		
		/* Queried user */
		User realUser = userDao.getByNaturalId(name);
		
		if(passwordEncoder.matches(oldPassword,realUser.getPassword())){
			if(newPassword.equals(verifyPassword)){
				userModifyAccountService.modifyPassword(realUser, newPassword);
			}
			else{
				return "redirect:/Manager/index?alert=password_failed";
			}
		}
		else if(!passwordEncoder.matches(oldPassword, realUser.getPassword())){
			return "redirect:/Manager/index?alert=password_wrong";
		}	
		
		return "redirect:/Manager/index?alert=password_change";
		
	}
}
