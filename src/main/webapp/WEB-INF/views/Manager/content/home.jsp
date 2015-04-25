<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="well well-sm">
	<h3>Welcome back ${name}!</h3>
</div>
<div class="panel panel-default">
	<div class="panel-heading">
		<b>We have few updates for you!</b>
	</div>
	<table class="table table-striped">
		<tr>
			<td>You have <input class="btn btn-primary btn-xs" type="button"
				value="${tradeRequests}"
				onclick="loadPage('content/traderApproval')" /> shift trades to
				approve.
			</td>
		</tr>
		<tr>
			<td>You have NUMBER employees to schedule for next week.</td>
		</tr>
		<tr>
			<td>NAME missed NUMBER shifts last week!</td>
		</tr>
	</table>
	<script>
		function loadPage(page) {

			$('#content').load(page);
		}
	</script>
</div>