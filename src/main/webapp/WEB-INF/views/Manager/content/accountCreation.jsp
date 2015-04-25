<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="well well-sm">
	<h3>Employee Account Creation</h3>
</div>
<div class="panel panel-default">
	<div class="panel-heading">
		<b>Below fill out a form to create a new user</b>
	</div>
<spring:url var="action" value="/Manager/content/accountCreation" />
<form:form method="post" action="${action}" commandName="user">
	<table class="table table-striped">
		<tr>
			<td>
				<div class="input-group col-md-5 col-lg-5 col-sm-5">
					<form:label path="email" class="input-group-addon">Email</form:label>
					<form:input path="email" class="form-control" placeholder="Enter email address" type="email"/>
				</div>
			</td>
		</tr>
		<tr>
			<td>
				<div class="input-group col-md-5 col-lg-5 col-sm-5">
					<form:label path="password" class="input-group-addon">Password</form:label>
					<form:password path="password" class="form-control" placeholder="Enter password" />
				</div>
			</td>
		</tr>
		<tr>
			<td>
				<div class="input-group col-md-5 col-lg-5 col-sm-5">
					<form:label path="verifyPassword" class="input-group-addon">Verify Password</form:label>
					<form:password path="verifyPassword" class="form-control" placeholder="Re-enter password"/>
				</div>
			</td>
		</tr>
		<tr>
			<td>
				<div class="input-group col-md-5 col-lg-5 col-sm-5">
					<form:label path="personName" class="input-group-addon">Name</form:label>
					<form:input path="personName" class="form-control" placeholder="Enter employee name"/>
				</div>
			</td>
		</tr>
		<tr>
			<td>
				<div class="input-group col-md-5 col-lg-5 col-sm-5">
					<form:label path="accountType" class="input-group-addon">User Type</form:label>
					<form:select path="accountType" items="${roleList}" class="form-control" placeholder="Select user type"/>
				</div>
			</td>
		</tr>
		<tr>
			<td>
				<div class="input-group col-md-5 col-lg-5 col-sm-5">
					<input class="btn btn-primary" type="submit" value="Submit" />
				</div>	
			</td>
		</tr>
	</table>
</form:form>
</div>