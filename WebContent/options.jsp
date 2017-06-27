<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Preference Page</title>
<link rel="stylesheet" href="/voting/css/bootstrap.min.css">
<style>
.page-header {
    font-size: 3vw;
    align-content: center;
    text-align: -webkit-center;
}
#main {
	
	height: 100%; 
	position: absolute;
	margin: 0 auto;
	background-color: #eee;
	left: 80px;
	right: 80px;
	top:0;
    bottom:0;
}

.inline-block .input-w {
  display: block; // to stack them
  width: 100%;
}

.inline-block .label, .inline-block a>img {
  float: none; 
  display: inline-block;
  vertical-align: middle;
  color: black;
}

 
</style>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body style="background-color: #FFAE00">
	<div class="container inline-block" id="main">
	
		<h2 class="page-header"> Please select option from below.</h2>
		<div class="row">
		<label class="input-w">
			<span class="label">Click here for list of candidates and their profiles</span>
		</label> <a
			href="candidate.jsp"><img src="/voting/images/view-profile.png"
			class="img-thumbnail" alt="View Profiles" width="304" height="236"></a>
		</div>
		<div class="row">
		<label class="input-w"><span class="label">Continue to vote for candidates</span></label>
		<a href="profile.jsp"><img src="/voting/images/vote.jpg"
			class="img-thumbnail" alt="Go for vote" width="304" height="236"></a>
		</div>
	</div>

</body>
</html>