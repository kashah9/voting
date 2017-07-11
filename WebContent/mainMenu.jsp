<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="/voting/css/topMenu.css">
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- <body>
	<i class="fa fa-bars fa-2x toggle-nav" data-toggle="collapse"
				data-target="#menu-content"></i>
	<nav class="navbar navbar-default navbar-fixed-top">
	
	<div class="container-fluid " >
		
		<ul class="nav navbar-nav collapse in" id="menu-content">
			<li class="active"><a href="/voting/candidate.jsp">Candidate
					List</a></li>
			<li class="#"><a href="#">About</a></li>
			<li class="#"><a href="#">Contact US</a></li>
		</ul>
		<ul class="nav navbar-nav navbar-right">
			<li><a href="#"><span class="glyphicon glyphicon-user"></span>Profile</a></li>
			<li><a href="/voting/Logout.jsp"><span
					class="glyphicon glyphicon-log-in"></span>Logout</a></li>
		</ul>
	</div>
	</nav>
	
</body> -->

</head>
<body>

<div class="topnav" id="myTopnav">
  <a href="#home">Home</a>
  <a href="/voting/candidate.jsp"><span class="glyphicon glyphicon-user"></span> Candidate Profiles</a>
  <a href="#contact">Contact</a>
  <a href="http://www.jaincenternj.org/">About</a>
  <a href="/voting/Logout.jsp"><span
					class="glyphicon glyphicon-log-in"></span> Logout</a>
  <a href="javascript:void(0);" style="font-size:15px;" class="icon" onclick="myFunction()">&#9776;</a>
</div>

<script>
function myFunction() {
    var x = document.getElementById("myTopnav");
    if (x.className === "topnav") {
        x.className += " responsive";
    } else {
        x.className = "topnav";
    }
}
</script>
</body>
</html>