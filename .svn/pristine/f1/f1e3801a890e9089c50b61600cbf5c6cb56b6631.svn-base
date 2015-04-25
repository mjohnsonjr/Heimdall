<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title>Timely - ${username}</title>
<meta name="description" content="Heimdall">

<!--        CSS Styles -->
<link rel="stylesheet"
	href="<c:url value="/resources/css/bootstrap.css"/>" />
<link rel="stylesheet"
	href="<c:url value="/resources/css/bootstrap-theme.css"/>" />
<link rel="stylesheet"
	href="<c:url value="/resources/css/bootstrap-formhelpers.css"/>" />
<link rel="stylesheet"
	href="<c:url value="/resources/css/daterangepicker-bs3.css"/>" />

</head>

<body>
	<!-- Manager Page -->
	<!-- Top Navbar -->
	<nav class="navbar navbar-default navbar-static-top" role="navigation">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target=".navbar-ex1-collapse">
				<span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span><span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="index"> <img alt="Timely" src="<c:url value="/resources/img/TimelyFullLogoSmall.png"/>" class="img-responsive" style="width: 30%;">
			</a>
		</div>
		<div class="collapse navbar-collapse navbar-ex1-collapse pull-right">
			<ul class="nav navbar-nav">
				<!-- Even though this is pulled right it is still stupid big, fix this -->
				<li><a href="#"><img alt="Profile Pic" src="<c:url value="/resources/img/timelyManSmall.png"/>" class="img-rounded pull-right" style="width: 15%;"></a></li>
				<li id="topbarOptions"><a href="content/options"><strong>${username}</strong><span class="glyphicon glyphicon-cog"></span></a></li>
				<li><a href="<c:url value="/logout"/>"><span class="glyphicon glyphicon-off"></span></a></li>
			</ul>
		</div>
	</nav>
	<!-- Side Navigation -->
	<div class="row side-buffer row-offcanvas row-offcanvas-left">
		<div class="col-xs-1 col-sm-2 col-md-2 col-lg-2 sidebar-offcanvas"
			id="sidebar" role="navigation">
			<div class="well sidebar-nav">
				<ul class="nav" id="sidebarList">
					<li><strong>Resources</strong></li>
					<li id="sidebarHome"><a href="content/home">Home</a></li>
					<li id="sidebarAccountCreation"><a href="content/accountCreation">Employee Account Creation</a></li>
					<li id="sidebaremployeeScheduling"><a href="content/employeeScheduling">Employee Scheduling</a></li>
					<li id="sidebarEmployeeOptions"><a href="content/employeeOptions">Employee Account Options</a></li>
					<li id="sidebarPayrollOptions"><a href="content/payrollOptions">Employee Payroll Options</a></li>
					<li id="sidebarTraderApproval"><a href="content/traderApproval">Shift Trader Approval</a></li>
				</ul>
			</div>
		</div>
		<!-- Alert Area -->
		<div class="col-md-10 col-sm-10" id="alert">
			
		</div>
		<!-- Main Content -->
		<div class="col-md-10 col-sm-10" id="content">
			<!-- This is where the ajax items are loaded -->
		</div>
		<p class="pull-left visible-xs">
			<button type="button" class="btn btn-primary btn-sm"
				data-toggle="offcanvas">
				<span class="glyphicon glyphicon-th"></span>
			</button>
		</p>

	</div>
	<!-- End Main Row -->
	<!-- Bread Crumbs -->
	<ol class="breadcrumb">
		<li><a href="<c:url value="/about"/>">About</a></li>
		<li><a href="<c:url value="/contact"/>">Contact Us</a></li>
		<li><a href="<c:url value="/careers"/>">Careers</a></li>
		<li><a href="<c:url value="/help"/>">Help</a></li>
	</ol>

	<!--        JavaScripts  -->
	<script src="<c:url value="/resources/js/jquery-1.10.2.min.js"/>"></script>
	<script src="<c:url value="/resources/js/bootstrap.min.js"/>"></script>
	<script src="<c:url value="/resources/js/offcanvas.js"/>"></script>
	<script src="<c:url value="/resources/js/manager.js"/>"></script>
	<script src="<c:url value="/resources/js/bootstrap-formhelpers.js"/>"></script>
	<script src="<c:url value="/resources/js/daterangepicker.js"/>"></script>
	<script src="<c:url value="/resources/js/moment.js"/>"></script>

</body>
</html>