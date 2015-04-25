<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
    <head>
    	<meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <title>Timely - Login</title>
        <meta name="description" content="Heimdall">
      
<!--        CSS Styles -->
    	<link rel="stylesheet" href="<c:url value="/resources/css/bootstrap.css"/>"/>
	   	<link rel="stylesheet" href="<c:url value="/resources/css/bootstrap-theme.css"/>"/> 
    </head>
    
    <body>
   
    	<div class="container">
    		<div class="row top-buffer">
    			<div class="col-md-10 col-sm-10 col-md-offset-1" id="content">
					<!-- This is where the ajax items are loaded -->
				</div>
    		</div>
    		<div class="row top-buffer">
    		    <!-- Timely Welcome Logo -->
    			<div class="col-sm-5 col-sm-offset-1 col-md-5 col-md-offset-1 col-lg-5 col-lg-offset-1">
					<img src="<c:url value="/resources/img/TimelyFullLogoSmall.png"/>" class="img-responsive">
					<h4>Timely . . . Schedule</h4>
					<h4>Timely . . . Work</h4>
					<h4>Timely . . . Pay</h4>
					<p>Interested in Timely? Sign Up!
					<a class="btn btn-default" type="button" name="here" value="Here!" href="<c:url value="/register"/>">Here!</a>
				</div>
				<!--  Login field  -->
				<div class="col-sm-5 col-md-5 col-lg-5 ">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h2 class="panel-title">Login</h2>
						</div>
						<div class="panel-body">
							<form role="form" id="login" action="<c:url value='j_spring_security_check' />" method="POST" name="f">
								<div class="form-group">
									<div class="input-group">
										<span class="input-group-addon">Email Address</span>
										<input id="j_username" type="email" name="j_username" value="" class="form-control" placeholder="Email Address"/>
									</div>
								</div>
								<div class="form-group">
									<div class="input-group">
										<span class="input-group-addon">Password</span>
										<input id="j_password" type="password" name="j_password" value="" class="form-control" placeholder="Amazing Password"/>
									</div>
								</div>
								<div class="pull-left">
									<input class="btn btn-default" type="submit" name="forgot" value="Forgot Password?" />
								</div>
								<div class="pull-right">
									<input class="btn btn-primary" data-loading-text="Setting Things Up..." type="submit" name="submit" value="Login"/>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Failed Login Alert -->
	
		<!--  Screen Shot -->
		<div class="row">
			<div class="col-sm-8 col-sm-offset-2 col-md-8 col-md-offset-2 col-lg-8 col-lg-offset-2">
				<img src="<c:url value="/resources/img/home-mac.jpg"/>" class="img-responsive">
			</div>
		</div>
		<hr class="soften">
		
		<!-- Company Information -->
		<!-- Three Pilers -->
		<div class="row side-buffer" align="center">
			<div class="col-xs-4 col-sm-4 col-md col-lg-4">
				<img src="<c:url value="/resources/img/featuresSmall.png"/>" class="img-responsive">
			</div>
			<div class="col-xs-4 col-sm-4 col-md col-lg-4">
				<img src="<c:url value="/resources/img/allSizingSmall.png"/>" class="img-responsive">
			</div>
			<div class="col-xs-4 col-sm-4 col-md col-lg-4">
				<img src="<c:url value="/resources/img/growingSmall.png"/>" class="img-responsive">
			</div>
		</div>
		<div class="row side-buffer" align="center">
			<div class="col-xs-4  col-sm-4 col-md-4 col-lg-4">
				
				<h2>Loads of features.</h2>
				<p>
					We could easily fill a 42 page paper with reasons to use Timely. But, we will just let you take our word on it or if your not the trusting type scroll down and read more about Timely.
				</p>
			</div>
			<div class="col-xs-4  col-sm-4 col-md-4 col-lg-4">
				
				<h2>Built for all businesses.</h2>
				<p>
					Timely is perfect for any sized company. Timely can easily handle 10 employees or 100,000 employees. If you do however have only one employee Timely may not be right for you. Altough we get why you love Timely so we will still let you sign up for it.
				</p>
			</div>
			<div class="col-xs-4  col-sm-4 col-md-4 col-lg-4">
				
				<h2>It just gets better.</h2>
				<p>
					As Timely is used more and more it will just keep getting better. So go on tell everyone you know about Timely: your mom, your dad, your friends, you boss, your old boss you do not like. We promise as our client list grows so will Timely's features and uses.
				</p>
			</div>
		</div>
		<hr class="soften">
		<!-- We are pretty great -->
		<div class="row">
			<div class="col-md-8 col-md-offset-2">
				<p class="text-center">
					We get it, we are the new kids on the block and your not sure if we are cool enough for your company. So the first 50 companies that sign up with us will have 5 free years of Timely. And since we are so cool the next 50 companies get a year free. Then after that everyone will get their first 3 months free.
				</p>
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
		<script src="<c:url value="/resources/js/general.js"/>"></script>	
	</body>
</html>