<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<link rel="stylesheet" href="/voting/css/bootstrap.min.css">
	<script src="/voting/js/jquery-3.2.1.min.js"></script>
	<script src="/voting/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<div class="container">
		<form action="candidateForm.jsp" method="post">
			<h1>Hello candidate, you got two options!</h1>
			<input type="submit" class="btn btn-primary btn-lg btn-block" value="Edit Profile">
		</form>
		<br/>
		<input type="button" class="btn btn-primary btn-lg btn-block" value="Go for Vote">
	</div>
	
</body>
</html>