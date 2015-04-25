<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<div class="well well-sm">
	<h3>Employee Scheduling</h3>
</div>

<!-- APPROVE EMPLOYEE SHIFT PREFERENCES -->
<spring:url var="action2" value="/Manager/content/employeeScheduling2" />
	<form:form method="post" action="${action2}" commandName="idMapWrapper">
		<div class="panel panel-default">
		<!-- Default panel contents -->
		<div class="panel-heading">
			<b>Below handle requested shifts:</b>
		</div>
	<!-- Table -->
		<table class="table table-striped">
			<tr>
				<td><b>Requested Shifts</b></td>
				<td><b>Your Decision</b></td>
			</tr>
			<c:forEach items="${shiftRequests}" var="shift" varStatus="shiftIndex">
				<tr>
					<td>
						<b>${shift.user.personName} (${shift.user.email}) </b> wants to work <b> 
							<fmt:formatDate type="both" dateStyle="long" timeStyle="short" value="${shift.startDate}"/> - 
							<fmt:formatDate type="both" dateStyle="long" timeStyle="short" value="${shift.startDate}"/>
						</b>
					</td>
					<td>
						<div class="input-group">
						<form:radiobuttons class="btn-group" path="ids[${shift.id}]" items="${options}" name="options" id="accept" />
						</div>
					</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<button class="btn btn-primary" id="applyDecisions" type="submit" value="Submit" data-loading-text="Processing.." class="btn btn-primary">Submit Decisions!</button>
</form:form>


<!--  ASSIGN SHIFTS TO EMPLOYEES BELOW -->
<p>
	<spring:url var="action" value="/Manager/content/employeeScheduling" />
	<form:form method="post" action="${action}" commandName="userSchedule">
		<div class="panel panel-default">
			<div class="panel-heading">
				<b>Below assign specific shifts:</b>
			</div>
			<!-- Table -->
			<table class="table table-striped">
				<tr>
					<td><b>Select Shift</b></td>
					<td><b>Assign Shift To:</b></td>
				</tr>
				<tr>
					<td>
						<!-- Put shift cal here -->
						<div class="input-group">
							<span class="input-group-addon">Schedule Upcoming Shift</span> 
							<input type="text" name="reservation" id="reservationtime" class="form-control" />
								<form:input hidden ="true" path="startDate" id="startDate" />
								<form:input hidden = "true" path="endDate" id="endDate" />
						</div>
					</td>
					<td>
						<div class="input-group">
							<span class="input-group-addon">Employee:</span>
							<form:select path="user.id" class="dropdown-toggle form-control" data-toggle="dropdown" href="#">
								<form:option value="0" label="--- Select ---" />
								<form:options items="${users}" itemLabel="accountDescription" itemValue="id" role="menu" aria-labelledby="dLabel" />
							</form:select>
						</div>
					</td>
				</tr>
			</table>
		</div>
		<button class="btn btn-primary" id="applyShift" type="submit" value="Submit" data-loading-text="Assigning" class="btn btn-primary">Assign Shift!</button>
	</form:form>
	
			<div class="panel panel-default">
				<div class="panel-heading">
					<b>Employee Shifts Viewer:</b>
				</div>
		<table class="table table-striped">
			<tr>
				<td class="col-md-5">
					<div class="input-group">
						<span class="input-group-addon">Employee:</span>
						<select class="dropdown-toggle form-control" id="scheduleViewer" data-toggle="dropdown" href="#">
								<option value="">Select Employee</option>
								<c:forEach items="${users}" var="user" varStatus="count" >
								<option value="${schedules[count.index]}">${user.personName}</option>
								</c:forEach>
						</select>
					</div>
				</td>
				<td>
					<div class="form-group">
					<div class="input-group">
						<textarea  class="form-control" rows="14" cols="100" id="scheduleHolder" readonly></textarea>
					</div>
					</div>
				</td>
			</tr>
		</table>
	</div>
<p>
<script>
		$("#scheduleViewer").click(function(){
				$("#scheduleHolder").val($("#scheduleViewer").val());
		});		
</script>
	<script>
		$(function() {
			$(".dropdown-menu li a").click(function() {
				$(".dropdown-toggle:first-child").text($(this).text());
				$(".dropdown-toggle:first-child").val($(this).text());
			});
		});
	</script>
	<script type="text/javascript">
		$(document).ready(function() {
			$('#reservationtime').daterangepicker({
				timePicker : true,
				timePickerIncrement : 15,
				format : 'MM/DD/YYYY h:mm A'
			});
		});
		$("#applyShift").click(function() {
			var date = $("#reservationtime").daterangepicker().val();
			$("#startDate").val(date.split("-")[0].trim());
			$("#endDate").val(date.split("-")[1].trim());
		});
	</script>