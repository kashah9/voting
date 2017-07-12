<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet"
	href="/voting/css/bootstrap.min.css">
	<link rel="stylesheet"
	href="/voting/css/thank.css">
<title>Insert title here</title>
</head>
<body style="background-color: #FFAE00">
	<div class="container">
	<%
		String status = request.getParameter("status");
		System.out.print("Status: "+status);
		if(status.equals("voted")){
	%>
       <h1 class="header-page">Thank You for voting!</h1><hr>
       <span class="center-div"><img src="/voting/images/thank-vote.png" width="400px" height="400px;"/></span>
       
       <a type="button" id="btn-cand" class="btn btn-primary btn-lg" href="candidateProfiles.jsp">Check out candidate Profile!</a>
    <%
		}
		else if(status.equals("again")){
    %>
    	<h1 class="header-page">You have voted already!</h1><hr>
    	<span class="center-div"><h3>Our records say that you have already voted!</h3></span>
    	<img src="/voting/images/thank-you.jpg" width="400px" height="400px"/>
    	<a class="btn btn-primary btn-lg" href="candidateProfiles.jsp">Check out candidate Profile!</a>
   	<%
		}
   	%>
	</div>
</body>
</html>