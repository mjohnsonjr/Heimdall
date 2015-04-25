<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="well well-sm">
	<h3>Welcome back ${name}!</h3>
</div>
<div class="panel panel-default">
	<div class="panel-heading">
		<b>Wow look at You! Here look we have statistics:</b>
	</div>
	<table class="table table-striped">
		<tr>
			<td>Your next shift starts: <b><fmt:formatDate type="both"
						dateStyle="long" timeStyle="short" value="${nextShiftStart}" /></b>,
				and ends on: <b><fmt:formatDate type="both" dateStyle="long"
						timeStyle="short" value="${nextShiftEnd}" /></b>.
			</td>
		</tr>
		<tr>
			<td>You have worked <b><fmt:formatNumber type="number"
						maxFractionDigits="2" value="${numberOfHoursWeek}" /></b> hours in the
				past week.
			</td>
		</tr>
		<tr>
			<td>You have worked <b><fmt:formatNumber type="number"
						maxFractionDigits="2" value="${numberOfHoursMonth}" /></b> hours this
				month.
			</td>
		</tr>
		<tr>
			<td>You have traded <b>${shiftsTradedMonth}</b> shifts this
				month.
			</td>
		</tr>
	</table>

</div>