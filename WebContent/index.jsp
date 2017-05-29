<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <title>Login Page</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link rel="stylesheet" href="/voting/css/login.css">
        <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Insert title here</title>
	</head>
	<body>
	<div class="jumbotron" id="form-wrapper">
	<div class="container">
	<h2 class="page-header">Jain Center of New Jersey</h2>
	  <form class="form-horizontal" action="/voting/LoginController" method="post">
	    <div class="form-group">
	      <label class="col-sm-2 col-sm-offset-2 control-label" for="email">Email:</label>
	      <div class="col-sm-4">
	        <input type="email" class="form-control" id="email" placeholder="Enter email" name="email">
	      </div>
	    </div>
	    <div class="form-group">
	      <label class="col-sm-2 col-sm-offset-2 control-label" for="pwd">Password:</label>
	      <div class="col-sm-4">          
	        <input type="password" class="form-control" id="pwd" placeholder="Enter password" name="pwd">
	      </div>
	    </div>
	    <%
	    String key = (String)request.getAttribute("key");
	    if(key!=null)
	    {
	    %>
	    <div class="col-sm-2"></div>
	    <div class="form-group">
	    	<label class="control-label col-sm-4" style="color:RED;">Please Enter Valid Email/Password Combination</label>
	    </div>
	    <%
	    }
	    %>
	    <div class="form-group">        
	      <div class="col-sm-offset-4 col-sm-2">
	        <button type="submit" class="btn btn-primary">Submit</button>
	      </div>
	    </div>
	  </form>
</div>
</div>
</body>
</html>