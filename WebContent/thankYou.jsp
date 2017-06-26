<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Insert title here</title>
</head>
<body style="background-color: #FFAE00">
	<div class="container">
	<%
		String status = request.getParameter("status");
		System.out.print("Status: "+status);
		if(status.equals("voted")){
	%>
       <h1 class="header-page">Thank You for Voting</h1><hr>
    <%
		}
		else if(status.equals("again")){
    %>
    	<h1 class="header-page">You have voted already!</h1><hr>
   	<%
		}
   	%>
	</div>
</body>
</html>