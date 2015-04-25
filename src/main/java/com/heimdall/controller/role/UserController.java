package com.heimdall.controller.role;

import java.security.Principal;
import java.util.LinkedList;
import java.util.List;

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
import com.heimdall.dao.model.User;
import com.heimdall.dao.model.UserSchedule;
import com.heimdall.dao.model.UserTrader;

@Controller
@RequestMapping("/User/**")
public class UserController extends BaseController {

	@Secured("ROLE_USER")
	@RequestMapping(value = "/User/index", method = RequestMethod.GET)
	public String printIndexUser(ModelMap model, Principal principal) {

		String name = principal.getName(); /* User name */
		model.addAttribute("username", name);

		log.debug("Authenticated USER \"" + name + "\" successfully.");
		return "/User/index.jsp";
	}

	// Home Page Content
	@Transactional
	@Secured("ROLE_USER")
	@RequestMapping(value = "/User/content/home", method = RequestMethod.GET)
	public String printAjaxHomeUser(ModelMap model, Principal principal) {

		String name = principal.getName(); /* User name */
		model.addAttribute("username", name);
		User user = userDao.getByNaturalId(name);
		model.addAttribute("name", user.getPersonName());

		/* Next working shift */
		UserSchedule nextShift = userScheduleDao.getNextShiftByUser(user);
		model.addAttribute("nextShiftStart", nextShift.getStartDate());
		model.addAttribute("nextShiftEnd", nextShift.getEndDate());

		/* Number of hours worked (time keeper table) */
		Double hours = userTimeKeeperDao.getAllHoursLoggedThisWeek(user);
		model.addAttribute("numberOfHoursWeek", hours);
		Double hours2 = userTimeKeeperDao.getAllHoursLoggedThisMonth(user);
		model.addAttribute("numberOfHoursMonth", hours2);
		model.addAttribute("shiftsTradedMonth", 4);

		return "/User/content/home.jsp";
	}

	// Calendar Page
	@Transactional
	@Secured("ROLE_USER")
	@RequestMapping(value = "/User/content/calendar", method = RequestMethod.GET)
	public String printAjaxHomeContent(ModelMap model, Principal principal) {

		String name = principal.getName(); /* User name */
		model.addAttribute("username", name);

		User user = userDao.getByNaturalId(name);

		/* Pass user ID, to find next 14 shifts for this user */
		List<UserSchedule> shifts = userScheduleDao.getListByUser(user);

		/* List of user shifts */
		model.addAttribute("shifts", shifts);

		return "/User/content/calendar.jsp";
	}

	// Shift Scheduler GET
	@Transactional
	@Secured("ROLE_USER")
	@RequestMapping(value = "/User/content/shiftScheduler", method = RequestMethod.GET)
	public String printAjaxShiftSchedulerContent(ModelMap model, Principal principal, @RequestParam(value = "alert", required = false, defaultValue = "1") String alert) {

		String name = principal.getName(); /* User name */
		model.addAttribute("username", name);

		model.addAttribute("userSchedule", new UserSchedule());

		List<User> userList = userDao.getListofUsers();
		model.addAttribute("users", userList);

		model.addAttribute("alert", alert);

		return "/User/content/shiftScheduler.jsp";
	}

	// Shift Scheduler POST
	@Transactional
	@Secured("ROLE_USER")
	@RequestMapping(value = "/User/content/shiftScheduler", method = RequestMethod.POST)
	public String printAjaxShiftSchedulerContent(ModelMap model, Principal principal, @ModelAttribute("userSchedule") UserSchedule userSchedule, BindingResult result) {

		String name = principal.getName(); /* User name */
		model.addAttribute("username", name);

		User user = userDao.getByNaturalId(name);
		if(userSchedule.getStartDate() == null || userSchedule.getEndDate() == null){
			return "redirect:/User/index?alert=password_failed";
		}
		
		/* Create new schedule. */
		userSchedule.setUser(user);
		userSchedule.setNeedsApproval(true);
		userScheduleDao.save(userSchedule);

		return "redirect:/User/index?alert=shift_requested";
	}

	// Shift Trader Page GET
	@Transactional
	@Secured("ROLE_USER")
	@RequestMapping(value = "/User/content/shiftTrader", method = RequestMethod.GET)
	public String printAjaxShiftTraderContent(ModelMap model, Principal principal, @RequestParam(value = "alert", required = false, defaultValue = "1") String alert) {

		String name = principal.getName(); /* User name */
		model.addAttribute("username", name);

		User user = userDao.getByNaturalId(name);

		/* Pass user ID, to find next 14 shifts this user can take (TODO: INCLUDE HIS OWN). */
		List<UserSchedule> shiftsForTrade = userTraderDao.getAvailableShiftsForUser(user);

		/* Used for POST (Putting shift up for trade */

		UserSchedule userSchedule = new UserSchedule();
		model.addAttribute("userSchedule", userSchedule);
		String idSchedule = new String();
		model.addAttribute("idSchedule", idSchedule);

		/* Used for POST (checkboxes for taking shifts) */
		IDListWrapper idList = new IDListWrapper();
		model.addAttribute("idListWrapper", idList);

		/* Get this user's own next 14 shifts */
		List<UserSchedule> thisUsersShifts = userScheduleDao.getTradableListByUser(user);

		/* Shifts for android */
		List<Long> start = new LinkedList<Long>();
		List<Long> end = new LinkedList<Long>();
		/* add data to model for android */
		for (UserSchedule sched : thisUsersShifts) {
			start.add(sched.getStartDate().getTime());
			end.add(sched.getEndDate().getTime());
		}

		/* List of user shifts */
		model.addAttribute("shiftsForTrade", shiftsForTrade);
		model.addAttribute("thisUsersShifts", thisUsersShifts);

		model.addAttribute("alert", alert);

		/* Android stuff states */
		model.addAttribute("startDate", start);
		model.addAttribute("endDate", end);

		return "/User/content/shiftTrader.jsp";
	}

	// POST for Shift Trader (TRADE A SHIFT)
	@Transactional
	@Secured("ROLE_USER")
	@RequestMapping(value = "/User/content/shiftTrader", method = RequestMethod.POST)
	public String printAjaxShiftTraderContent(Principal principal, @ModelAttribute("id") String id, BindingResult result) {

		UserSchedule userSchedule = userScheduleDao.getById(Long.valueOf(id));

		UserTrader userTrader = new UserTrader();
		userTrader.setUser(userSchedule.getUser());
		userTrader.setUserSchedule(userSchedule);
		userTrader.setNeedsApproval(false);

		userTraderDao.save(userTrader);

		log.debug("Saved a new user schedule to POST A SHIFT!");

		return "redirect:/User/index?alert=shift_posted";
	}

	// POST for Shift Trader (TAKE A SHIFT)
	@Transactional
	@Secured("ROLE_USER")
	@RequestMapping(value = "/User/content/shiftTrader2", method = RequestMethod.POST)
	public String printAjaxShiftTraderContent2(ModelMap model, Principal principal, @ModelAttribute("idList") IDListWrapper idList, BindingResult result) {

		model.addAttribute("idList", idList);
		String name = principal.getName();
		User user = userDao.getByNaturalId(name);

		/* Remove from trade options, find trade options id from UserSchedule id. */
		List<UserTrader> trades = new LinkedList<UserTrader>();

		/* Query and get all trades, add to list. */
		for (String id : idList.getIds()) {
			if (id != null) {
				trades.add(userTraderDao.getByNaturalId(userScheduleDao.getById(Long.parseLong(id))));
			}
		}

		/*
		 * Update database row, send to manager for approval. Only then is it removed from the previous owner.
		 */
		for (UserTrader trade : trades) {
			/*
			 * Change the employee, mark as needs approval from a manager. MAnager will approve and the shift will be changed.
			 */
			trade.setUser(user);
			trade.setNeedsApproval(true);
			userTraderDao.saveOrUpdate(trade);

		}

		log.debug("Saved a new user schedule change request!");

		return "redirect:/User/index?alert=shift_taken";
	}

	// Time keeper Page
	@Secured("ROLE_USER")
	@RequestMapping(value = "/User/content/timeKeeper", method = RequestMethod.GET)
	public String printAjaxtimeKeeperContent(ModelMap model, Principal principal) {

		String name = principal.getName(); /* User name */

		model.addAttribute("username", name);

		return "/User/content/timeKeeper.jsp";
	}

	// Account Options Page GET
	@Secured("ROLE_USER")
	@RequestMapping(value = "/User/content/options", method = RequestMethod.GET)
	public String printAjaxOptions(ModelMap model, Principal principal) {

		String name = principal.getName(); /* User name */
		model.addAttribute("username", name);

		/* Fill new data, to update user profile */
		User user = new User();
		model.addAttribute("user", user);

		return "/User/content/options.jsp";
	}

	// Account Options Page POST
	@Transactional
	@Secured("ROLE_USER")
	@RequestMapping(value = "/User/content/options", method = RequestMethod.POST)
	public String printAjaxOptions(ModelMap model, Principal principal, @ModelAttribute("user") User user, BindingResult result) {

		String name = principal.getName(); /* User name */
		model.addAttribute("username", name);
		/* User Change password Logic */
		String oldPassword = user.getOldPassword();
		String newPassword = user.getPassword();
		String verifyPassword = user.getVerifyPassword();

		/* Queried user */
		User realUser = userDao.getByNaturalId(name);

		if (passwordEncoder.matches(oldPassword, realUser.getPassword())) {
			if (newPassword.equals(verifyPassword)) {
				userModifyAccountService.modifyPassword(realUser, newPassword);
			} else {
				return "redirect:/User/index?alert=password_failed";
			}
		} else if (!passwordEncoder.matches(oldPassword, realUser.getPassword())) {
			return "redirect:/User/index?alert=password_wrong";
		}

		return "redirect:/User/index?alert=password_change";

	}
}