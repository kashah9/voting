<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Login Page</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/voting/css/login.css">
<link rel="stylesheet" href="/voting/css/bootstrap.min.css">
<script src="/voting/js/jquery-3.2.1.min.js"></script>
<script src="/voting/js/bootstrap.min.js"></script>
<script src="/voting/js/validator.min.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<body style="background-color: #FFAE00;">
	<div class="wrap">
		<div class="container" id="form-wrapper">
			<div class="page-header text-center">Jain Center of New Jersey</div>
			<form class="form-horizontal" action="/voting/LoginController"
				data-toggle="validator" method="post">
				<div class="form-group margin-bottom">
					<label class="col-sm-2 col-sm-offset-2 control-label" for="email">Email:</label>
					<div class="col-sm-4">
						<input type="email" class="form-control" id="email"
							placeholder="Enter email" name="email"
							data-error="Enter valid Email" required autofocus>
					</div>
					<div class="help-block with-errors"></div>
				</div>
				<div class="form-group margin-bottom">
					<label class="col-sm-2 col-sm-offset-2 control-label" for="pwd">Password:</label>
					<div class="col-sm-4">
						<input type="password" class="form-control" id="pwd"
							placeholder="Enter password" name="pwd" required>
					</div>
					<div class="help-block with-errors"></div>
				</div>
				<div class="form-group">
				<label id="logout">
					<%=request.getParameter("logout")%>
				</label>
				</div>
				<%
					String key = (String) request.getAttribute("key");
					if (key != null) {
				%>

				<div class="form-group margin-bottom">
					<label class="control-label col-sm-4 col-sm-offset-4"
						style="color: RED;">Please Enter Valid Email/Password
						Combination
					</label>
				</div>
				
				<%
					}
					
					%>  
				<div class="form-group">
					<label class="col-sm-offset-2 col-sm-2"></label>
					<div class="col-sm-4">
						<button type="submit"
							class="btn btn-primary col-sm-6 col-sm-offset-3">Login</button>
					</div>
				</div>
			</form>
			
		</div>
		<%@include file="footer.jsp"%>
	</div>
<script>

	$(document).ready(function(){
		document.getElementById("logout").style.visibility = "hidden";
	});
	
  	/* setTimeout(function() {
	    $('#logout').hide();
	}, 10000); */

</script>
</body>
</html>