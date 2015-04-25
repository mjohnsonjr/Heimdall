$.ajaxSetup({
	cache : false
});

$(document).ready(function() {

	// Failed Login
	var error = window.location.search;
	
	if(error == "?error=login_failed"){
		$('#content').append(
				"<div class=\"alert alert-danger alert-dismissable\">" + 
				"<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-hidden=\"true\">&times;</button>" +
				"<strong>Error!</strong> Incorrect email or password entered. Please try again. " +
				"</div>");
	};
	
	if(error == "?error=password_match"){
		$('#content').append(
				"<div class=\"alert alert-danger alert-dismissable\">" + 
				"<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-hidden=\"true\">&times;</button>" +
				"<strong>Error!</strong> Password do not match. Please try again." +
				"</div>");
	};
	
	if(error == "?error=user_exists"){
		$('#content').append(
				"<div class=\"alert alert-danger alert-dismissable\">" + 
				"<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-hidden=\"true\">&times;</button>" +
				"<strong>Error!</strong> User already exists. Please try registering another user." +
				"</div>");
	};
	
	if(error == "?error=registration_success"){
		$('#content').append(
				"<div class=\"alert alert-success alert-dismissable\">" + 
				"<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-hidden=\"true\">&times;</button>" +
				"<strong>Success!</strong> Account has been successfully registered. " +
				"</div>");
	};
	
	
	
});