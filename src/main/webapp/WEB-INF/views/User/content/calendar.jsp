<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="well well-sm">
	<h3>Calendar</h3>
</div>

<!-- The schedule list (probably 2 weeks) -->
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
		</tr>
		<c:forEach items="${shifts}" var="shift">
			<tr>
				<td><fmt:formatDate type="both" dateStyle="long" timeStyle="short" value="${shift.startDate}"/></td>
				<td><fmt:formatDate type="both" dateStyle="long" timeStyle="short" value="${shift.endDate}"/></td>
			</tr>
		</c:forEach>
	</table>
</div>
