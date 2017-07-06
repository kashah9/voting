<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<link rel="stylesheet" href="/voting/css/bootstrap.min.css">
	<link rel="stylesheet" href="/voting/css/login.css">
	<script src="/voting/js/jquery-3.2.1.min.js"></script>
    <script src="/voting/js/bootstrap.min.js"></script>
<title>Logout</title>
</head>
<body>
	<div class="jumbotron" id="form-wrapper">
	<div class="container">
	<%
	session = request.getSession();  
    session.invalidate(); 
   
	%>
	
	<h2 class="page-header">You're successfully logged out! Please close this window for your security!</h2>
	<jsp:forward page="index.jsp">
		<jsp:param name="logout" value="You have successfully logged out!" />
	</jsp:forward> 
	</div>
	</div>

</body>
</html>