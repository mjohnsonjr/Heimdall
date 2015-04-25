<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<div class="well well-sm">
	<h3>Account Options</h3>
</div>
<div class="row">
	<div class="col-md-2">
		<img alt="Profile Pic" src="<c:url value="/resources/img/timelyManSmall.png"/>" class="img-thumbnail">
	</div>
	<div class="col-md-8">
		<h4>Profile Picture</h4>
		<p>
			<button type="button" data-loading-text="Requestededed..." class="btn btn-default">
				Upload New Picture
			</button>
		</p>
		<p>
			<button type="button" class="btn btn-default"> Back to Default</button>
		</p>
		<p>
			*Max File Size 50kb
		</p>
	</div>
</div>

<spring:url var = "action" value="/Manager/content/options"/>
	<form:form method="post" action="${action}" commandName="user">
		<div class="panel panel-default top-buffer">
			<div class="panel-heading">Change password</div>
			<table class="table table-striped">
				<tr>
					<td>
						<div class="input-group col-md-5">
							<form:label path="oldPassword" class="input-group-addon">Old Password</form:label>
							<form:password path="oldPassword" class="form-control" placeholder="Enter old password" />
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
				