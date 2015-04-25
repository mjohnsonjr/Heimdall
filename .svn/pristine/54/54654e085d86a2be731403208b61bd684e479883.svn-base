<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title>Timely - Registration</title>
<meta name="description" content="Heimdall">

<!--        CSS Styles -->
<link rel="stylesheet"
	href="<c:url value="/resources/css/bootstrap.css"/>" />
<link rel="stylesheet"
	href="<c:url value="/resources/css/bootstrap-theme.css"/>" />

</head>

<body>
   	<div class="row top-buffer">
   		<div class="col-md-10 col-sm-10 col-md-offset-1" id="content">
			<!-- This is where the ajax items are loaded -->
		</div>
   	</div>
	<div class="row" align="center">
		<div class="col-md-4 col-md-offset-4 ">
			<a class="brand" href="<c:url value="/"/>">
				<img src="<c:url value="/resources/img/TimelyFullLogo.png"/>" class="img-responsive" >
			</a>
		</div>
	</div>
	<div class="row top-buffer" align="center">
		<div class="col-md-4 col-md-offset-4 ">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h4>Wow, you have some great taste. We know you are just going
					to love Timely.</h4>
					<p>To complete registration for you company complete all fields
					below. Then hit submit and that is it! Your company is now setup.
					Upon login the first time you will need fill out a few more items.
					Oh! You will have to add some employees, unless you know you don not
					want to.</p>
				</div>
				<form:form method="post" action="register" commandName="user">
					<div class="panel-body">
						<div class="form-group">
							<div class="input-group">
								<form:label path="email" class="input-group-addon">Email</form:label>
								<form:input path="email" class="form-control" placeholder="Enter email address" type="email"/>
							</div>
						</div>
						<div class="form-group">
							<div class="input-group">
								<form:label path="password" class="input-group-addon">Password</form:label>
								<form:password path="password" class="form-control" placeholder="Enter password" />
							</div>
						</div>
						<div class="form-group">
							<div class="input-group">
								<form:label path="verifyPassword" class="input-group-addon">Verify Password</form:label>
								<form:password path="verifyPassword" class="form-control" placeholder="Re-enter password"/>
							</div>
						</div>
						<div class="form-group">
							<div class="input-group">
								<form:label path="personName" class="input-group-addon">Name</form:label>
								<form:input path="personName" class="form-control" placeholder="Enter user name"/>
							</div>
						</div>
						<div class="form-group">
							<div class="input-group">
								<form:label path="accountType" class="input-group-addon">User Type</form:label>
								<form:select path="accountType" items="${roleList}" class="form-control" placeholder="Select user type"/>
							</div>
						</div>
						<div class="pull-left">
							<input class="btn btn-primary" type="submit" value="Submit" />
						</div>
					</div>
				</form:form>
			</div>

		</div>
	</div>
	<!--        JavaScripts -->
	<script src="<c:url value="/resources/js/jquery-1.10.2.min.js" />"></script>
	<script src="<c:url value="/resources/js/bootstrap.min.js"/>"></script>
	<script src="<c:url value="/resources/js/general.js"/>"></script>	
</body>
</html>
