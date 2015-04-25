<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <title>Heimdall</title>
        <meta name="description" content="Heimdall">
      
<!--        CSS Styles -->
        <link rel="stylesheet" href="<c:url value="resources/css/normalize.css"/>"/>
        <link rel="stylesheet" href="<c:url value="resources/css/main.css"/>"/>
      
<!--        JavaScripts -->
        <script src="<c:url value="resources/js/jquery-1.8.0.min.js" />"></script>        
        <script src="<c:url value="resources/js/modernizr-2.6.1.min.js"/>"></script>
        <script src="<c:url value="resources/js/bootstrap.js"/>"></script>
    </head>
    <body>
    
		<div class="well" id = "123">
			<h1>Hello testing.</h1>
			<p>The time on the server is ${serverTime}.</p>
		</div>
		
	<!--  Login field  -->
	<h1>Welcome !</h1>
	<form id="login" action="<c:url value='j_spring_security_check' />" method="POST" name="f">
		<div class="row-fluid">
			<div class="span4">
				<fieldset id="user-details">
					<label for="j_username">User Name : <span class="required">*</span></label>
					<input id="j_username" type="text" name="j_username" value="" /> 
					<label for="password">Password: <span class="required">*</span></label> 
					<input id="j_password" type="password" name="j_password" value=""/>
					<input class="submit btn" type="submit" name="submit" value="Login" />
				</fieldset>
			</div>
		</div>
	</form>

</body>
</html>