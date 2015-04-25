<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<div class="well well-sm">
	<h3>Shift Trader</h3>
</div>
<!-- Nav tabs -->
<ul class="nav nav-tabs">
  <li class="active"><a href="#trade" data-toggle="tab">Trade-A-Shift</a></li>
  <li><a href="#take" data-toggle="tab">Take-A-Shift</a></li>
</ul>

<!-- Tab panes -->
<div class="tab-content">
	<div class="tab-pane fade in active" id="trade">
		<!-- Trade-A-Shift -->
		<div class="panel panel-default">
			<!-- Default panel contents -->
			<div class="panel-heading">Do not want a shift? Do not have time for a shift? Get ride of it!</div>
			<!-- Table To Keep a consitent took between tabs -->

			<!-- 		Begin input for shift. -->
			<spring:url var = "action" value="/User/content/shiftTrader"/>
			<form:form method="post" action="${action}" commandName="userSchedule">
				<table class="table table-striped">
					<tr>
						<td><b>Shift to post to Take-A-Shift</b></td>
					</tr>
					<tr>
						<td>
							<div class="input-group col-md-5">
								<span class="input-group-addon">Selected Shift</span>
								<form:select path="id" class="form-control">
									<form:option value="NONE" label="--- Select ---" />
									<form:options items="${thisUsersShifts}" itemValue="id" itemLabel = "formatDateString"/> 
								</form:select>
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<input class="btn btn-primary" type="submit" value="Put Shift Up For Trade!" />
						</td>
					</tr>
				</table>
			</form:form>
		</div>
	</div>
  	<div class="tab-pane fade" id="take">
  		<!-- The schedule list (probably 2 weeks) -->
		
		<spring:url var = "action2" value="/User/content/shiftTrader2"/>
		<form:form method="post" action="${action2}" commandName = "idListWrapper"> <!-- From the HTTP GET controller -->
		<div class="panel panel-default">
			<!-- Default panel contents -->
			<div class="panel-heading">${username}'s Work Schedule</div>
			<div class="panel-body">
				<p>Note: All times are in reference to a 24 hour clock.  Shows up to 14 next shifts.</p>
			</div>
		
		<!-- Table -->
			<table class="table table-striped">
				<tr>
					<td><b>Shift Start</b></td>
					<td><b>Shift End</b></td>
					<td><b>Select-A-Shift</b></td>
				</tr>
				
				<c:forEach items="${shiftsForTrade}" var="shift" varStatus="shiftNum">
					<tr>
						<td><fmt:formatDate type="both" dateStyle="long" timeStyle="short" value="${shift.startDate}"/></td>
						<td><fmt:formatDate type="both" dateStyle="long" timeStyle="short" value="${shift.endDate}"/></td>
						<td>
								<form:checkbox value = "${shift.id}" item = "${shift.id}" path = "ids[${shiftNum.index}]" itemValue="id"/>
						</td>
					</tr>
				</c:forEach>
<%-- 				<form:checkboxes element="li" items="${shifts}" path="ids" values = "${shifts}" itemLabel="id" itemValue="id"/> --%>
				<tr>
					<td>
						<input class="btn btn-primary" type="submit" value="Take These Shifts!" />
					</td>
					<td></td>
					<td></td>
				</tr>
			</table>
		</div>
		</form:form>
		<p>
	</div>
</div>