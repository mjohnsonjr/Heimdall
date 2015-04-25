$.ajaxSetup({
	cache : false
});

$(document).ready(function() {

	//Alert
	var error = window.location.search;
	//Default page
	var pageInitial = $('#sidebarHome a').attr('href');
	
	//Handles for employee registration
	//Checks for various errors otherwise just loads page
	//Employee Account Registration Password miss-match
	if(error.indexOf("?alert=password_match") !== -1){
		$('#alert').append(
				"<div class=\"alert alert-danger alert-dismissable\">" + 
				"<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-hidden=\"true\">&times;</button>" +
				"<strong>Warning!</strong> Password do not match. Please try again." +
				"</div>");
		var page = $('#sidebarAccountCreation a').attr('href');
		$('#content').load(page);
	}
	
	//Employee Account Registration User exists already
	else if(error.indexOf("?alert=user_exists") !== -1){
		$('#alert').append(
				"<div class=\"alert alert-danger alert-dismissable\">" + 
				"<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-hidden=\"true\">&times;</button>" +
				"<strong>Warning!</strong> User already exists. Please try registering another user." +
				"</div>");
		var page = $('#sidebarAccountCreation a').attr('href');
		$('#content').load(page);
	}
	
	//Employee Account Registration successful
	else if(error.indexOf("?alert=registration_success") !== -1){
		$('#alert').append(
				"<div class=\"alert alert-success alert-dismissable\">" + 
				"<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-hidden=\"true\">&times;</button>" +
				"<strong>Success!</strong> Account has been successfully registered. " +
				"</div>");
		var page = $('#sidebarAccountCreation a').attr('href');
		$('#content').load(page);
	}
	
	//Employee Scheduling shift assigned 
	else if(error.indexOf("?alert=shift_assigned") !== -1){
		$('#alert').append(
				"<div class=\"alert alert-success alert-dismissable\">" + 
				"<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-hidden=\"true\">&times;</button>" +
				"<strong>Success!</strong> Shift has been assigned. " +
				"</div>");
		var page = $('#sidebaremployeeScheduling a').attr('href');
		$('#content').load(page);
	}
	
	//Employee Scheduling shift not assigned 
	else if(error.indexOf("?alert=no_shift") !== -1){
		$('#alert').append(
				"<div class=\"alert alert-danger alert-dismissable\">" + 
				"<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-hidden=\"true\">&times;</button>" +
				"<strong>Error!</strong> No shift has been assigned. " +
				"</div>");
		var page = $('#sidebaremployeeScheduling a').attr('href');
		$('#content').load(page);
	}
	
	//Employee Account Options
	else if(error.indexOf("?alert=employee_removed") !== -1){
		$('#alert').append(
				"<div class=\"alert alert-success alert-dismissable\">" + 
				"<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-hidden=\"true\">&times;</button>" +
				"<strong>Success!</strong> Successfully removed employee. " +
				"</div>");
		var page = $('#sidebarEmployeeOptions a').attr('href');
		$('#content').load(page);
	}

	//Employee Payroll Options
	else if(error.indexOf("?alert=time_approved") !== -1){
		$('#alert').append(
				"<div class=\"alert alert-success alert-dismissable\">" + 
				"<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-hidden=\"true\">&times;</button>" +
				"<strong>Success!</strong> Employee's hours have been approved. " +
				"</div>");
		var page = $('#sidebarPayrollOptions a').attr('href');
		$('#content').load(page);
	}
	
	//Employee Trader trades submitted
	else if(error.indexOf("?alert=trades_handled") !== -1){
		$('#alert').append(
				"<div class=\"alert alert-success alert-dismissable\">" + 
				"<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-hidden=\"true\">&times;</button>" +
				"<strong>Success!</strong> Decisions on trades have been submitted. " +
				"</div>");
		var page = $('#sidebarTraderApproval a').attr('href');
		$('#content').load(page);
	}
	//Account Option page, password changed successfully
	else if(error.indexOf("?alert=password_change") !== -1){
		$('#alert').append(
				"<div class=\"alert alert-success alert-dismissable\">" + 
				"<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-hidden=\"true\">&times;</button>" +
				"<strong>Success!</strong> Password has been changed." +
				"</div>");
		var page = $('#sidebarEmployeeOptions a').attr('href');
		$('#content').load(page);
	}
	
	
	//Account Option page, old password entered wrong
	else if(error.indexOf("?alert=password_wrong") !== -1){
		$('#alert').append(
				"<div class=\"alert alert-danger alert-dismissable\">" + 
				"<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-hidden=\"true\">&times;</button>" +
				"<strong>Error!</strong> Old password did not match user password." +
				"</div>");
		var page = $('#sidebarEmployeeOptions a').attr('href');
		$('#content').load(page);
	}
	
	//Account Options page, new passwords did not match
	else if(error.indexOf("?alert=password_failed") !== -1){
		$('#alert').append(
				"<div class=\"alert alert-danger alert-dismissable\">" + 
				"<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-hidden=\"true\">&times;</button>" +
				"<strong>Error!</strong> Password change failed. Passwords did not match." +
				"</div>");
		var page = $('#sidebarEmployeeOptions a').attr('href');
		$('#content').load(page);
	}
	
	//Account Option page, changes were successful
	else if(error.indexOf("?alert=changes_success") !== -1){
		$('#alert').append(
				"<div class=\"alert alert-success alert-dismissable\">" + 
				"<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-hidden=\"true\">&times;</button>" +
				"<strong>Success!</strong> Changes were successful." +
				"</div>");
		var page = $('#sidebarEmployeeOptions a').attr('href');
		$('#content').load(page);
	}
	
	//Account Option page, disable account successful
	else if(error.indexOf("?alert=disable_success") !== -1){
		$('#alert').append(
				"<div class=\"alert alert-success alert-dismissable\">" + 
				"<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-hidden=\"true\">&times;</button>" +
				"<strong>Success!</strong> disable account successful." +
				"</div>");
		var page = $('#sidebarEmployeeOptions a').attr('href');
		$('#content').load(page);
	}
	
	//Account Option page, enable account successful
	else if(error.indexOf("?alert=enable_success") !== -1){
		$('#alert').append(
				"<div class=\"alert alert-success alert-dismissable\">" + 
				"<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-hidden=\"true\">&times;</button>" +
				"<strong>Success!</strong> Enable account successful." +
				"</div>");
		var page = $('#sidebarEmployeeOptions a').attr('href');
		$('#content').load(page);
	}
	
	
	//Schedule Request 
	else if(error.indexOf("?alert=schedule_request") !== -1){
		var page = $('#topbarOptions a').attr('href');
		$('#content').load(page);
	}
	//No alert, load home page
	else{
		$('#content').load(pageInitial);
	};
	
	
	// Home
	$('#sidebarHome').click(function() {

		var page = $('#sidebarHome a').attr('href');
		$('#content').load(page);
		
		return false;
	});

	// Employee Account Creation
	$('#sidebarAccountCreation').click(function() {

		var page = $('#sidebarAccountCreation a').attr('href');
		$('#content').load(page);

		return false;
	});

	// Employee Scheduling
	$('#sidebaremployeeScheduling').click(function() {

		var page = $('#sidebaremployeeScheduling a').attr('href');
		$('#content').load(page);

		return false;
	});

	// Employee Account Options
	$('#sidebarEmployeeOptions').click(function() {

		var page = $('#sidebarEmployeeOptions a').attr('href');
		$('#content').load(page);

		return false;
	});

	// Employee Payroll Options
	$('#sidebarPayrollOptions').click(function() {

		var page = $('#sidebarPayrollOptions a').attr('href');
		$('#content').load(page);

		return false;
	});

	// Shift Trader Approval
	$('#sidebarTraderApproval').click(function() {

		var page = $('#sidebarTraderApproval a').attr('href');
		$('#content').load(page);

		return false;
	});

	// Manager Options
	// Shift Trader Approval
	$('#topbarOptions').click(function() {

		var page = $('#topbarOptions a').attr('href');
		$('#content').load(page);

		return false;
	});

});