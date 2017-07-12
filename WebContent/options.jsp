<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Preference Page</title>
<link rel="stylesheet" href="/voting/css/bootstrap.min.css">
<style>
div span {
	
}
</style>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body style="background-color: #FFAE00">
	<%@include file="mainMenu.jsp"%>
	<div class="container" id="main">

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