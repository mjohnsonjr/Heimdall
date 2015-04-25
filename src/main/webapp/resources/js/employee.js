$.ajaxSetup({
	cache: false
});

function init(){
	$.fn.pluginName;
}

$(document).ready(function(){
	
	//Alert
	var error = window.location.search;
	//Initial
	var pageInitial = $('#sidebarHome a').attr('href');
	
//	//Shift Scheduler
	if(error.indexOf("?alert=shift_requested") !== -1){
		$('#alert').append(
				"<div class=\"alert alert-success alert-dismissable\">" + 
				"<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-hidden=\"true\">&times;</button>" +
				"<strong>Success!</strong> Shift has been successfully requested. " +
				"</div>");
		var page = $('#sidebarShiftScheduler a').attr('href');
		$('#content').load(page);
	}
	//Trade-A-Shift
	else if(error.indexOf("?alert=shift_posted") !== -1){
		$('#alert').append(
				"<div class=\"alert alert-success alert-dismissable\">" + 
				"<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-hidden=\"true\">&times;</button>" +
				"<strong>Success!</strong> Shift has been successfully posted to Take-A-Shift. " +
				"</div>");
		var page = $('#sidebarShiftTrader a').attr('href');
		$('#content').load(page);
	}
	//Take-A-Shift
	else if(error.indexOf("?alert=shift_taken") !== -1){
		$('#alert').append(
				"<div class=\"alert alert-success alert-dismissable\">" + 
				"<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-hidden=\"true\">&times;</button>" +
				"<strong>Success!</strong> Shift has been taken successfully. Awaiting approval from manager." +
				"</div>");
		var page = $('#sidebarShiftTrader a').attr('href');
		$('#content').load(page);
	}
//	//Time Keeper IMPLEMENT ONCE TIME KEEPER WORKS
//	else if(error.indexOf("?alert=time_recorded") !== -1){
//		$('#alert').append(
//				"<div class=\"alert alert-success alert-dismissable\">" + 
//				"<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-hidden=\"true\">&times;</button>" +
//				"<strong>Success!</strong> Hours worked have been successfully recorded." +
//				"</div>");
//		var page = $('#sidebarTimeKeeper a').attr('href');
//		$('#content').load(page);
//	}
	//Account Option page, password changed successfully
	else if(error.indexOf("?alert=password_change") !== -1){
		$('#alert').append(
				"<div class=\"alert alert-success alert-dismissable\">" + 
				"<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-hidden=\"true\">&times;</button>" +
				"<strong>Success!</strong> Password has been changed." +
				"</div>");
		var page = $('#topbarOptions a').attr('href');
		$('#content').load(page);
	}
	
	//Account Option page, old password entered wrong
	else if(error.indexOf("?alert=password_wrong") !== -1){
		$('#alert').append(
				"<div class=\"alert alert-danger alert-dismissable\">" + 
				"<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-hidden=\"true\">&times;</button>" +
				"<strong>Error!</strong> Old password did not match user password." +
				"</div>");
		var page = $('#topbarOptions a').attr('href');
		$('#content').load(page);
	}
	
	//Account Options page, new passwords did not match
	else if(error.indexOf("?alert=password_failed") !== -1){
		$('#alert').append(
				"<div class=\"alert alert-danger alert-dismissable\">" + 
				"<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-hidden=\"true\">&times;</button>" +
				"<strong>Error!</strong> Password change failed. Passwords did not match." +
				"</div>");
		var page = $('#topbarOptions a').attr('href');
		$('#content').load(page);
	}
	else{
		$('#content').load(pageInitial);
	};
	
	//Home
	$('#sidebarHome').click(function(){
		
		var page = $('#sidebarHome a').attr('href');
		var currentPath = window.location.pathname;
		
		$('#content').load(page);
		
		return false;
	});
	
	//Calendar
	$('#sidebarCalendar').click(function(){
		
		var page = $('#sidebarCalendar a').attr('href');
		$('#content').load(page);
		
		return false;
	});
	
	//Shift Scheduler
	$('#sidebarShiftScheduler').click(function(){
		
		var page = $('#sidebarShiftScheduler a').attr('href');
		$('#content').load(page);
		
		return false;
	});
	
	//Shift Trader
	$('#sidebarShiftTrader').click(function(){
		
		var page = $('#sidebarShiftTrader a').attr('href');
		$('#content').load(page);
		
		return false;
	});
	
	//Time Keeper
	$('#sidebarTimeKeeper').click(function(){
		
		var page = $('#sidebarTimeKeeper a').attr('href');
		$('#content').load(page);
		
		return false;
	});
	
	//Account Options
	$('#topbarOptions').click(function(){
		
		var page = $('#topbarOptions a').attr('href');
		$('#content').load(page);
		
		return false;
	});
	
});