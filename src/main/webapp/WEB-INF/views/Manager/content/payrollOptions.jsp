<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="well well-sm">
	<h3>Employee Payroll Options</h3>
</div>

<div class="panel panel-default">
	<div class="panel-heading">
		<div class="dropdown">
			<a role="button" class="dropdown-toggle btn btn-default btn-sm" data-toggle="dropdown" href="#">
				<b>Employee</b>
				<b class="caret"></b>
			</a>
			<ul class="dropdown-menu" role="menu" aria-labelledby="dLabel">
				<!-- Need to add logic here to pull in the shifts and allow selection -->
				<li role="presentation"><a role="menuitem" tabindex="-1" href="#">EMPLOYEE NAME</a></li>
			</ul>
		</div>
	</div>
	<table class="table table-striped">
		<tr>
			<td>
				<b>Hours Worked</b>
			</td>
			<td>
				<b>Sunday</b>
			</td>
			<td>
				<b>Monday</b>
			</td>
			<td>
				<b>Tuesday</b>
			</td>
			<td>
				<b>Wednesday</b>
			</td>
			<td>
				<b>Thursday</b>
			</td>
			<td>
				<b>Friday</b>
			</td>
			<td>
				<b>Saturday</b>
			</td>
		</tr>
		<tr>
			<td>
				<b>This Week</b>
			</td>
			<td>
				<div class="bfh-timepicker">
					<div class="input-group bfh-timepicker-toggle" data-toggle="bfh-timepicker">
						<span class="input-group-addon">
							<i class="glyphicon glyphicon-time"></i>
						</span>
						<input type="text" name class="form-control" readonly>
					</div>
					<div class="bfh-timepicker-popover">
						<table class="table">
							<tbody>
								<tr>
									<td class="hour">
										<a class="next" href="#">
											<i class="glyphicon glyphicon-chevron-up"></i>
										</a>
										<br>
										<input type="text" readonly>
										<br>
										<a class="previous" href="#">
											<i class="glyphicon glyphicon-chevron-down"></i>
										</a>
									</td>
									<td class="separator">:</td>
									<td class="minute">
										<a class="next" href="#">
											<i class="glyphicon glyphicon-chevron-up"></i>
										</a>
										<br>
										<input type="text" readonly>
										<br>
										<a class="previous" href="#">
											<i class="glyphicon glyphicon-chevron-down"></i>
										</a>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</td>
			<td>
				<div class="bfh-timepicker">
					<div class="input-group bfh-timepicker-toggle" data-toggle="bfh-timepicker">
						<span class="input-group-addon">
							<i class="glyphicon glyphicon-time"></i>
						</span>
						<input type="text" name class="form-control" readonly>
					</div>
					<div class="bfh-timepicker-popover">
						<table class="table">
							<tbody>
								<tr>
									<td class="hour">
										<a class="next" href="#">
											<i class="glyphicon glyphicon-chevron-up"></i>
										</a>
										<br>
										<input type="text" readonly>
										<br>
										<a class="previous" href="#">
											<i class="glyphicon glyphicon-chevron-down"></i>
										</a>
									</td>
									<td class="separator">:</td>
									<td class="minute">
										<a class="next" href="#">
											<i class="glyphicon glyphicon-chevron-up"></i>
										</a>
										<br>
										<input type="text" readonly>
										<br>
										<a class="previous" href="#">
											<i class="glyphicon glyphicon-chevron-down"></i>
										</a>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</td>
			<td>
				<div class="bfh-timepicker">
					<div class="input-group bfh-timepicker-toggle" data-toggle="bfh-timepicker">
						<span class="input-group-addon">
							<i class="glyphicon glyphicon-time"></i>
						</span>
						<input type="text" name class="form-control" readonly>
					</div>
					<div class="bfh-timepicker-popover">
						<table class="table">
							<tbody>
								<tr>
									<td class="hour">
										<a class="next" href="#">
											<i class="glyphicon glyphicon-chevron-up"></i>
										</a>
										<br>
										<input type="text" readonly>
										<br>
										<a class="previous" href="#">
											<i class="glyphicon glyphicon-chevron-down"></i>
										</a>
									</td>
									<td class="separator">:</td>
									<td class="minute">
										<a class="next" href="#">
											<i class="glyphicon glyphicon-chevron-up"></i>
										</a>
										<br>
										<input type="text" readonly>
										<br>
										<a class="previous" href="#">
											<i class="glyphicon glyphicon-chevron-down"></i>
										</a>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</td>
			<td>
				<div class="bfh-timepicker">
					<div class="input-group bfh-timepicker-toggle" data-toggle="bfh-timepicker">
						<span class="input-group-addon">
							<i class="glyphicon glyphicon-time"></i>
						</span>
						<input type="text" name class="form-control" readonly>
					</div>
					<div class="bfh-timepicker-popover">
						<table class="table">
							<tbody>
								<tr>
									<td class="hour">
										<a class="next" href="#">
											<i class="glyphicon glyphicon-chevron-up"></i>
										</a>
										<br>
										<input type="text" readonly>
										<br>
										<a class="previous" href="#">
											<i class="glyphicon glyphicon-chevron-down"></i>
										</a>
									</td>
									<td class="separator">:</td>
									<td class="minute">
										<a class="next" href="#">
											<i class="glyphicon glyphicon-chevron-up"></i>
										</a>
										<br>
										<input type="text" readonly>
										<br>
										<a class="previous" href="#">
											<i class="glyphicon glyphicon-chevron-down"></i>
										</a>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</td>
			<td>
				<div class="bfh-timepicker">
					<div class="input-group bfh-timepicker-toggle" data-toggle="bfh-timepicker">
						<span class="input-group-addon">
							<i class="glyphicon glyphicon-time"></i>
						</span>
						<input type="text" name class="form-control" readonly>
					</div>
					<div class="bfh-timepicker-popover">
						<table class="table">
							<tbody>
								<tr>
									<td class="hour">
										<a class="next" href="#">
											<i class="glyphicon glyphicon-chevron-up"></i>
										</a>
										<br>
										<input type="text" readonly>
										<br>
										<a class="previous" href="#">
											<i class="glyphicon glyphicon-chevron-down"></i>
										</a>
									</td>
									<td class="separator">:</td>
									<td class="minute">
										<a class="next" href="#">
											<i class="glyphicon glyphicon-chevron-up"></i>
										</a>
										<br>
										<input type="text" readonly>
										<br>
										<a class="previous" href="#">
											<i class="glyphicon glyphicon-chevron-down"></i>
										</a>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</td>
			<td>
				<div class="bfh-timepicker">
					<div class="input-group bfh-timepicker-toggle" data-toggle="bfh-timepicker">
						<span class="input-group-addon">
							<i class="glyphicon glyphicon-time"></i>
						</span>
						<input type="text" name class="form-control" readonly>
					</div>
					<div class="bfh-timepicker-popover">
						<table class="table">
							<tbody>
								<tr>
									<td class="hour">
										<a class="next" href="#">
											<i class="glyphicon glyphicon-chevron-up"></i>
										</a>
										<br>
										<input type="text" readonly>
										<br>
										<a class="previous" href="#">
											<i class="glyphicon glyphicon-chevron-down"></i>
										</a>
									</td>
									<td class="separator">:</td>
									<td class="minute">
										<a class="next" href="#">
											<i class="glyphicon glyphicon-chevron-up"></i>
										</a>
										<br>
										<input type="text" readonly>
										<br>
										<a class="previous" href="#">
											<i class="glyphicon glyphicon-chevron-down"></i>
										</a>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</td>
			<td>
				<div class="bfh-timepicker">
					<div class="input-group bfh-timepicker-toggle" data-toggle="bfh-timepicker">
						<span class="input-group-addon">
							<i class="glyphicon glyphicon-time"></i>
						</span>
						<input type="text" name class="form-control" readonly>
					</div>
					<div class="bfh-timepicker-popover">
						<table class="table">
							<tbody>
								<tr>
									<td class="hour">
										<a class="next" href="#">
											<i class="glyphicon glyphicon-chevron-up"></i>
										</a>
										<br>
										<input type="text" readonly>
										<br>
										<a class="previous" href="#">
											<i class="glyphicon glyphicon-chevron-down"></i>
										</a>
									</td>
									<td class="separator">:</td>
									<td class="minute">
										<a class="next" href="#">
											<i class="glyphicon glyphicon-chevron-up"></i>
										</a>
										<br>
										<input type="text" readonly>
										<br>
										<a class="previous" href="#">
											<i class="glyphicon glyphicon-chevron-down"></i>
										</a>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</td>
		</tr>
		<tr>
			<td>
				<b>Last Week</b>
			</td>
			<td>
				<div class="bfh-timepicker">
					<div class="input-group bfh-timepicker-toggle" data-toggle="bfh-timepicker">
						<span class="input-group-addon">
							<i class="glyphicon glyphicon-time"></i>
						</span>
						<input type="text" name class="form-control" readonly>
					</div>
					<div class="bfh-timepicker-popover">
						<table class="table">
							<tbody>
								<tr>
									<td class="hour">
										<a class="next" href="#">
											<i class="glyphicon glyphicon-chevron-up"></i>
										</a>
										<br>
										<input type="text" readonly>
										<br>
										<a class="previous" href="#">
											<i class="glyphicon glyphicon-chevron-down"></i>
										</a>
									</td>
									<td class="separator">:</td>
									<td class="minute">
										<a class="next" href="#">
											<i class="glyphicon glyphicon-chevron-up"></i>
										</a>
										<br>
										<input type="text" readonly>
										<br>
										<a class="previous" href="#">
											<i class="glyphicon glyphicon-chevron-down"></i>
										</a>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</td>
			<td>
				<div class="bfh-timepicker">
					<div class="input-group bfh-timepicker-toggle" data-toggle="bfh-timepicker">
						<span class="input-group-addon">
							<i class="glyphicon glyphicon-time"></i>
						</span>
						<input type="text" name class="form-control" readonly>
					</div>
					<div class="bfh-timepicker-popover">
						<table class="table">
							<tbody>
								<tr>
									<td class="hour">
										<a class="next" href="#">
											<i class="glyphicon glyphicon-chevron-up"></i>
										</a>
										<br>
										<input type="text" readonly>
										<br>
										<a class="previous" href="#">
											<i class="glyphicon glyphicon-chevron-down"></i>
										</a>
									</td>
									<td class="separator">:</td>
									<td class="minute">
										<a class="next" href="#">
											<i class="glyphicon glyphicon-chevron-up"></i>
										</a>
										<br>
										<input type="text" readonly>
										<br>
										<a class="previous" href="#">
											<i class="glyphicon glyphicon-chevron-down"></i>
										</a>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</td>
			<td>
				<div class="bfh-timepicker">
					<div class="input-group bfh-timepicker-toggle" data-toggle="bfh-timepicker">
						<span class="input-group-addon">
							<i class="glyphicon glyphicon-time"></i>
						</span>
						<input type="text" name class="form-control" readonly>
					</div>
					<div class="bfh-timepicker-popover">
						<table class="table">
							<tbody>
								<tr>
									<td class="hour">
										<a class="next" href="#">
											<i class="glyphicon glyphicon-chevron-up"></i>
										</a>
										<br>
										<input type="text" readonly>
										<br>
										<a class="previous" href="#">
											<i class="glyphicon glyphicon-chevron-down"></i>
										</a>
									</td>
									<td class="separator">:</td>
									<td class="minute">
										<a class="next" href="#">
											<i class="glyphicon glyphicon-chevron-up"></i>
										</a>
										<br>
										<input type="text" readonly>
										<br>
										<a class="previous" href="#">
											<i class="glyphicon glyphicon-chevron-down"></i>
										</a>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</td>
			<td>
				<div class="bfh-timepicker">
					<div class="input-group bfh-timepicker-toggle" data-toggle="bfh-timepicker">
						<span class="input-group-addon">
							<i class="glyphicon glyphicon-time"></i>
						</span>
						<input type="text" name class="form-control" readonly>
					</div>
					<div class="bfh-timepicker-popover">
						<table class="table">
							<tbody>
								<tr>
									<td class="hour">
										<a class="next" href="#">
											<i class="glyphicon glyphicon-chevron-up"></i>
										</a>
										<br>
										<input type="text" readonly>
										<br>
										<a class="previous" href="#">
											<i class="glyphicon glyphicon-chevron-down"></i>
										</a>
									</td>
									<td class="separator">:</td>
									<td class="minute">
										<a class="next" href="#">
											<i class="glyphicon glyphicon-chevron-up"></i>
										</a>
										<br>
										<input type="text" readonly>
										<br>
										<a class="previous" href="#">
											<i class="glyphicon glyphicon-chevron-down"></i>
										</a>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</td>
			<td>
				<div class="bfh-timepicker">
					<div class="input-group bfh-timepicker-toggle" data-toggle="bfh-timepicker">
						<span class="input-group-addon">
							<i class="glyphicon glyphicon-time"></i>
						</span>
						<input type="text" name class="form-control" readonly>
					</div>
					<div class="bfh-timepicker-popover">
						<table class="table">
							<tbody>
								<tr>
									<td class="hour">
										<a class="next" href="#">
											<i class="glyphicon glyphicon-chevron-up"></i>
										</a>
										<br>
										<input type="text" readonly>
										<br>
										<a class="previous" href="#">
											<i class="glyphicon glyphicon-chevron-down"></i>
										</a>
									</td>
									<td class="separator">:</td>
									<td class="minute">
										<a class="next" href="#">
											<i class="glyphicon glyphicon-chevron-up"></i>
										</a>
										<br>
										<input type="text" readonly>
										<br>
										<a class="previous" href="#">
											<i class="glyphicon glyphicon-chevron-down"></i>
										</a>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</td>
			<td>
				<div class="bfh-timepicker">
					<div class="input-group bfh-timepicker-toggle" data-toggle="bfh-timepicker">
						<span class="input-group-addon">
							<i class="glyphicon glyphicon-time"></i>
						</span>
						<input type="text" name class="form-control" readonly>
					</div>
					<div class="bfh-timepicker-popover">
						<table class="table">
							<tbody>
								<tr>
									<td class="hour">
										<a class="next" href="#">
											<i class="glyphicon glyphicon-chevron-up"></i>
										</a>
										<br>
										<input type="text" readonly>
										<br>
										<a class="previous" href="#">
											<i class="glyphicon glyphicon-chevron-down"></i>
										</a>
									</td>
									<td class="separator">:</td>
									<td class="minute">
										<a class="next" href="#">
											<i class="glyphicon glyphicon-chevron-up"></i>
										</a>
										<br>
										<input type="text" readonly>
										<br>
										<a class="previous" href="#">
											<i class="glyphicon glyphicon-chevron-down"></i>
										</a>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</td>
			<td>
				<div class="bfh-timepicker">
					<div class="input-group bfh-timepicker-toggle" data-toggle="bfh-timepicker">
						<span class="input-group-addon">
							<i class="glyphicon glyphicon-time"></i>
						</span>
						<input type="text" name class="form-control" readonly>
					</div>
					<div class="bfh-timepicker-popover">
						<table class="table">
							<tbody>
								<tr>
									<td class="hour">
										<a class="next" href="#">
											<i class="glyphicon glyphicon-chevron-up"></i>
										</a>
										<br>
										<input type="text" readonly>
										<br>
										<a class="previous" href="#">
											<i class="glyphicon glyphicon-chevron-down"></i>
										</a>
									</td>
									<td class="separator">:</td>
									<td class="minute">
										<a class="next" href="#">
											<i class="glyphicon glyphicon-chevron-up"></i>
										</a>
										<br>
										<input type="text" readonly>
										<br>
										<a class="previous" href="#">
											<i class="glyphicon glyphicon-chevron-down"></i>
										</a>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</td>
		</tr>
	</table>
</div>

<script>
	$(".bfh-timepicker").bfhtimepicker('toggle');
</script>

<button type="button" data-loading-text="Requestededed..." class="btn btn-primary">
	Submit Decisions!
</button>
<p>

<script src="<c:url value="/resources/js/bootstrap-formhelpers.js"/>"></script>
