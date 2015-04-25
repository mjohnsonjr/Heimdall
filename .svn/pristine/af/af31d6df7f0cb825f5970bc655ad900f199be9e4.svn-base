<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<div class="well well-sm">
	<h3>Shift Trader Approval</h3>
</div>

<div class="panel panel-default">
	<!-- Default panel contents -->
	<div class="panel-heading">
		<b>Select shifts trades to approve or decline below.</b>
	</div>
	<!-- Table -->
	<spring:url var="action" value="/Manager/content/traderApproval" />
	<form:form method="post" action="${action}" commandName="idMapWrapper">
		<table class="table table-striped">
			<tr>
				<td><b>Requested Trades</b></td>
				<td><b>Your Decision</b></td>
			</tr>
			<!--  POST MANAGER ACCEPTANCES -->
			<c:forEach items="${tradeRequests}" var="trade" varStatus="tradeIndex">
				<tr>
					<td>
						<b>${trade.user.personName} (${trade.user.email}) </b> wants to work <b> 
							<fmt:formatDate type="both" dateStyle="long" timeStyle="short" value="${trade.userSchedule.startDate}"/> - 
							<fmt:formatDate type="both" dateStyle="long" timeStyle="short" value="${trade.userSchedule.endDate}"/>
						</b>
					</td>
					<td>
						<form:radiobuttons class="btn-group" data-toggle="buttons" path="ids[${trade.id}]" items="${options}" name="options" id="accept" />
					</td>
				</tr>
			</c:forEach>
			<!--  END POST -->
			<tr>
				<td>
					<input class="btn btn-primary" data-loading-text="Submitting" type="submit" value="Submit Decisions!" /></td>
				<td></td>
			</tr>
		</table>
	</form:form>
</div>
<p>