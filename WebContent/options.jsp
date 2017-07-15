<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
body{
	background-color: #FFAE00;
	margin-top: 25px;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Preference Page</title>
<link rel="stylesheet" href="/voting/css/bootstrap.min.css">

<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container" id="main">
		<%@include file="mainMenu.jsp"%>
		<h2 class="page-header text-center">Please select option from
			below</h2>
		<div class="row">
			<div class="col-md-4 col-sm-offset-2">
				<span class="label">Click below to check out the candidate
					profiles </span> <a href="candidateProfiles.jsp"><img
					src="/voting/images/options1.jpg" class="img-thumbnail"
					alt="View Candidate Profiles" width="354" height="250"></a>
			</div>
			<div class="col-md-4">
				<span class="label">Click below to vote</span> <a href="ballotPaper.jsp"><img
					src="/voting/images/options2.jpg" class="img-thumbnail"
					alt="Go Vote" width="354" height="250"></a>
			</div>
		</div>
	</div>
<%@include file="footer.jsp"%>
</body>
</html>