$.ajaxSetup({
	cache: false
});

$(document).ready(function(){
	
	//Alert
	var error = window.location.search;
	//Initial
	var pageInitial = $('#sidebarHome a').attr('href');
	
	//All Users Options page, password changed successfully
	if(error.indexOf("?alert=changes_failure") !== -1){
		$('#alert').append(
				"<div class=\"alert alert-danger alert-dismissable\">" + 
				"<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-hidden=\"true\">&times;</button>" +
				"<strong>Success!</strong> Changes failed." +
				"</div>");
		var page = $('#sidebarAllUsersOptions a').attr('href');
		$('#content').load(page);
	}
	//Account Option page, changes were successful
	else if(error.indexOf("?alert=changes_success") !== -1){
		$('#alert').append(
				"<div class=\"alert alert-success alert-dismissable\">" + 
				"<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-hidden=\"true\">&times;</button>" +
				"<strong>Success!</strong> Changes were successful." +
				"</div>");
		var page = $('#sidebarAllUsersOptions a').attr('href');
		$('#content').load(page);
	}
	//No alert, load home page
	else{
		$('#content').load(pageInitial);
	};
	
	//Home
	$('#sidebarHome').click(function(){
		
		var page = $('#sidebarHome a').attr('href');
		//var currentPath = window.location.pathname;
		
		$('#content').load(page);
		
		return false;
	});
	//PersonalAccountOptions
	$('#sidebarPersonalAccountOptions').click(function(){
		
		var page = $('#sidebarPersonalAccountOptions a').attr('href');
		//var currentPath = window.location.pathname;
		
		$('#content').load(page);
		
		return false;
	});
	//CompanyAccountOptions
	$('#sidebarCompanyAccountOptions').click(function(){
		
		var page = $('#sidebarCompanyAccountOptions a').attr('href');
		//var currentPath = window.location.pathname;
		
		$('#content').load(page);
		
		return false;
	});
	//Site Status
	$('#sidebarSiteStatus').click(function(){
		
		var page = $('#sidebarSiteStatus a').attr('href');
		//var currentPath = window.location.pathname;
		
		$('#content').load(page);
		
		return false;
	});

	//Message
	$('#sidebarMessage').click(function(){
		
		var page = $('#sidebarMessage a').attr('href');
		//var currentPath = window.location.pathname;
		
		$('#content').load(page);
		
		return false;
	});
	
	//All Users Options
	$('#sidebarAllUsersOptions').click(function(){
		
		
		var page = $('#sidebarAllUsersOptions a').attr('href');
		//var currentPath = window.location.pathname;
		
		$('#content').load(page);
		
		return false;
	});
	
});