<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
    <head>
    	<meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <title>Timely Help</title>
        <meta name="description" content="Heimdall">
      
		<!-- CSS Styles -->
    	<link rel="stylesheet" href="<c:url value="/resources/css/bootstrap.css"/>"/>
	   	<link rel="stylesheet" href="<c:url value="/resources/css/bootstrap-theme.css"/>"/> 
    </head>
	<body>
		<div class="container">
			<div class="row">
				<div class="col-md-4 col-md-offset-2">
					<a class="brand" href="<c:url value="/"/>">
						<img src="<c:url value="/resources/img/TimelyFullLogo.png"/>" class="img-responsive" >
					</a>
				</div>
				<div class="col-md-4">
					<h2>Timely Help</h2>
				</div>
			</div>
			<div class="row">
				<div class="col-md-8 col-md-offset-2">
					<div class="well">
						<p>
							Just give our favorite help desk leader Mike Johnson a ring at 224-723-3451. He is always on call, 24 hours a day, 7 days a week, 365 days a year.
						</p>
					</div>
				</div>
			</div>
		</div>
		<ol class="breadcrumb">
    		<li><a href="<c:url value="/about"/>">About</a></li>
    		<li><a href="<c:url value="/contact"/>">Contact Us</a></li>
    		<li><a href="<c:url value="/careers"/>">Careers</a></li>
    		<li><a href="<c:url value="/help"/>">Help</a></li>
  		</ol>
		<!--        JavaScripts  -->
        <script src="<c:url value="/resources/js/jquery-1.10.2.min.js"/>"></script>        
		<script src="<c:url value="/resources/js/bootstrap.min.js"/>"></script>
	</body>
</html>