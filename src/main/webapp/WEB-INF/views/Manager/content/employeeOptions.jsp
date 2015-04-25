<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="well well-sm">
	<h3>Employee Account Management</h3>
</div>
<div class="panel panel-default">
	<div class="panel-heading">
		<b>Disable employee</b>
	</div>
	<spring:url var="action" value="/Manager/content/employeeOptionsDisable" />
		<form:form method="post" action="${action}" commandName="user">
		<table class="table table-striped">
			<tr>
				<td>
					<div class="input-group col-md-5 col-lg-5 col-sm-5">
						<form:label path="id" class="input-group-addon">Employee Name</form:label>
						<form:select path="id" class="form-control" >
							<form:option value="0" label="Employee" />
							<form:options items="${users}" itemLabel="personName" itemValue="id" role="menu" aria-labelledby="dLabel" />
						</form:select>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="input-group col-md-5 col-lg-5 col-sm-5">
						<input class="btn btn-primary" type="submit" value="Disable" />
					</div>	
				</td>
			</tr>
		</table>
	</form:form>
</div>

<div class="panel panel-default">
	<div class="panel-heading">
		<b>Enable employee</b>
	</div>
	<spring:url var="action" value="/Manager/content/employeeOptionsEnable" />
	<form:form method="post" action="${action}" commandName="user">
		<table class="table table-striped">
			<tr>
				<td>
					<div class="input-group col-md-5 col-lg-5 col-sm-5">
						<form:label path="id" class="input-group-addon">Employee Name</form:label>
						<form:select path="id" class="form-control" >
							<form:option value="0" label="Employee" />
							<form:options items="${users}" itemLabel="personName" itemValue="id" role="menu" aria-labelledby="dLabel" />
						</form:select>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="input-group col-md-5 col-lg-5 col-sm-5">
						<input class="btn btn-primary" type="submit" value="Enable" />
					</div>	
				</td>
			</tr>
		</table>
	</form:form>
</div>

	<spring:url var="action" value="/Manager/content/employeeOptionsModify" />
		<form:form method="post" action="${action}" commandName="user">
			<div class="panel panel-default top-buffer">
				<div class="panel-heading"><b>Edit Employee account information</b></div>
				<table class="table table-striped">
					<tr>
						<td>
							<div class="input-group col-md-5 col-lg-5 col-sm-5">
								<form:label path="id" class="input-group-addon">Employee Name</form:label>
								<form:select path="id" class="form-control" >
									<form:option value="0" label="Employee" />
									<form:options items="${users}" itemLabel="personName" itemValue="id" role="menu" aria-labelledby="dLabel" />
								</form:select>
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<div class="input-group col-md-5">
								<form:label path="personName" class="input-group-addon">New Name</form:label>
								<form:input path="personName" class="form-control" placeholder="Enter new name" />
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<div class="input-group col-md-5">
								<form:label path="password" class="input-group-addon">New Password</form:label>
								<form:password path="password" class="form-control" placeholder="Enter new password"/>
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<div class="input-group col-md-5">
								<form:label path="verifyPassword" class="input-group-addon">Verify New Password</form:label>
								<form:password path="verifyPassword" class="form-control" placeholder="Re-enter new password"/>
							</div>
						</td>
					</tr>
					<tr>
						<td colspan="2"><input class="btn btn-primary" type="submit" value="Submit" /></td>
					</tr>
			</table>
		</div>
	</form:form>
</div>