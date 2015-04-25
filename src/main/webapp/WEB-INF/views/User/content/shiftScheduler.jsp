<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<div class="well well-sm">
		<h3>Shift Scheduler</h3>
</div>

<spring:url var="action" value="/User/content/shiftScheduler" />
	<form:form method="post" action="${action}" commandName="userSchedule">
		<div class="panel panel-default">
			<div class="panel-heading">
				<b>Select a specific shift you'd like to work (to be approved by your manager):</b>
			</div>
			<!-- Table -->
			<table class="table table-striped">
				<tr>
					<td><b>Select Shift</b></td>
				</tr>
				<tr>
					<td>
						<!-- Put shift cal here -->
						<div class="input-group col-md-5">
							<span class="input-group-addon">Your Preferred Shift</span> 
							<input type="text" name="reservation" id="reservationtime" class="form-control" />
							<form:input hidden = "true" path="startDate" id="startDate" />
							<form:input hidden = "true" path="endDate" id="endDate" />
						</div>
					</td>
				</tr>
			</table>
		</div>
		<button class="btn btn-primary" id="applyShift" type="submit" value="Submit" data-loading-text="Requesting" class="btn btn-primary">Submit Preference!</button>
	</form:form>
<p>
<!-- Date Range Picker -->
<script type="text/javascript">
	$(document).ready(function(){
		$('#reservationtime').daterangepicker({ timePicker: true, timePickerIncrement: 30, format: 'MM/DD/YYYY h:mm A' });
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