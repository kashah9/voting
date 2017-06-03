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
	
    <h2 class="page-header2">Oops, Please login first to access this Web-page</h2>
    <br />
    <a class="btn btn-primary btn-lg btn-block" href="/voting/index.jsp" role="button">Go to Login Page</a>
    <br/>
    <p id="errorCode"><b>Error code:</b> ${pageContext.errorData.statusCode}</p>
    <p id="errorCode"><b>Request URI:</b> ${pageContext.request.scheme}://${header.host}${pageContext.errorData.requestURI}</p>
    <br />
    </div>
    </div>
</body>
</html>