<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Error Page</title>
		<link rel="stylesheet" href="/voting/css/bootstrap.min.css">
        <link rel="stylesheet" href="/voting/css/error.css">
        <script src="/voting/js/jquery-3.2.1.min.js"></script>
        <script src="/voting/js/bootstrap.min.js"></script>
</head>
<body>
	
	<div class="jumbotron" id="form-wrapper">
	<div class="container">
	
    <h1 class="page-header">Oops, Page Not Found.</h1>
    <br />
    
    <a class="btn btn-primary btn-lg btn-block" onclick="history.back()">Back to Previous Page</a>
    <br/>
    <a class="btn btn-primary btn-lg btn-block" href="/voting/index.jsp">Login Page</a>
    <br/>
    <p id="errorCode"><b>Error code:</b> ${pageContext.errorData.statusCode}</p>
   	<p id="errorCode"><b>Request URI:</b> ${pageContext.request.scheme}://${header.host}${pageContext.errorData.requestURI}</p>
    <br />
    </div>
    <%@include file="footer.jsp" %>
    </div>
</body>
</html>