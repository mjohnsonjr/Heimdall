<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
    <head>
    	<meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <title>Contact Timely</title>
        <meta name="description" content="Heimdall">
      
		<!-- CSS Styles -->
    	<link rel="stylesheet" href="<c:url value="/resources/css/bootstrap.css"/>"/>
	   	<link rel="stylesheet" href="<c:url value="/resources/css/bootstrap-theme.css"/>"/>
	   	<link rel="stylesheet" href="<c:url value="/resources/css/bootstrap-formhelpers.css"/>"/> 
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
					<h2>Contact Timely</h2>
				</div>
			</div>
			<div class="row">
				<div class="col-md-8 col-md-offset-2">
					<div class="well">
						<h4>
							Want to get a hold of us? Just fill out the form below and we will get back to you quickly. 
						</h4>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-8 col-md-offset-2">
					<div class="well">
						<form:form method="post" commandName="contactForm" role="form">
							<div class="form-group">
								<div class="input-group">
									<span class="input-group-addon">Name</span>
									<input type="text" class="form-control" placeholder="Enter Name">
								</div>
							</div>
							<div class="form-group">
								<div class="input-group">
									<span class="input-group-addon">Email Address</span>
									<input type="email" class="form-control" placeholder="Enter Email">
								</div>
							</div>
							<div class="from-group">
								<div class="input-group">
									<span class="input-group-addon">Phone Number</span>
									<input type="text" class="form-control bfh-phone" data-format="+1 (ddd) ddd-dddd">
								</div>
							</div>
							<p>
							<div class="from-group">
								<div class="input-group">
									<label for="contactReason">What would you like to let us know?</label>
									<textarea class="form-control" id="contactReason" rows="4" cols="80"></textarea>
								</div>
							</div>
							<br>
							<button type="submit" class="btn btn-default">Submit</button>
						</form:form>
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
		<script src="<c:url value="/resources/js/bootstrap-formhelpers.js"/>"></script>
		
	</body>
</html>