<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="voting.ElectionBean, java.util.*, voting.UserBean, voting.CandidateBean"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Candidate Form Page</title>

<link rel="stylesheet" href="/voting/css/login.css">
<link rel="stylesheet" href="/voting/css/bootstrap.min.css">
<script src="/voting/js/jquery-3.2.1.min.js"></script>

<script src="/voting/js/bootstrap.min.js"></script>
<script
	src="/voting/js/validator.min.js"></script>
</head>
<body style="background-color: #FFAE00;">
	<div>
		<div class="container" id="form-wrapper">
			<h2 class="page-header">JCNJ: Candidate Profile</h2>
			<%
				// Disabling the browser back button which fetches data from cache memory
				response.setHeader("Cache-Control", "no-cache"); // Forces caches to obtain a new copy of the page from the origin server
				response.setHeader("Cache-Control", "no-store"); // Directs caches not to store the page under any circumstance
				response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale" 

			%>
			<form class="form-horizontal" data-toggle="validator"
				action="/voting/candidateFormController" method="post"
				enctype="multipart/form-data">
				<div class="form-group row">
					<label class="col-sm-2 col-sm-offset-2 control-label">Member
						ID</label>
					<div class="col-sm-4">
						<input type="number" name="id" class="form-control" required autofocus>
						<small class="form-text text-muted">Enter your JCNJ Membership ID</small>
					</div>
					<div class="help-block with-errors"></div>
				</div>
				
				<div class="form-group row">
					<label class="col-sm-2 col-sm-offset-2 control-label">Full
						Name</label>
					<div class="col-sm-4">
						<input type="text" name="name" class="form-control" required>
					</div>
					<div class="help-block with-errors"></div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2 col-sm-offset-2 control-label">Address</label>
					<div class="col-sm-4">
						<input type="text" name="address" class="form-control" required>
					</div>
					<div class="help-block with-errors"></div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2 col-sm-offset-2 control-label">Position
						Name</label>
					<div class="col-sm-4">

						<select class="form-control" name="position_name" required>
							<option value="" default>Select Option</option>
							<option value="President">President</option>
							<option value="Chairman">Chairman</option>
							<option value="EC">EC</option>
						</select>
					</div>
					<div class="help-block with-errors"></div>
				</div>

				<div class="form-group row">
					<label class="col-sm-2 col-sm-offset-2 control-label">Enter
						Profile</label>
					<div class="col-sm-4">
						<textarea class="form-control" name="profile" rows="8" 
							data-error="Bruh, that profile is invalid" required></textarea>
					</div>
					<div class="help-block with-errors"></div>
				</div>
				
				<div class="form-group row">
					<label class="col-sm-2 col-sm-offset-2 control-label">Upload
						Image</label>
					<div class="col-sm-4">
						<input type="file" name="file" class="form-control-file" accept='image/*' required />
						<small class="form-text text-muted">Please upload the
							image, allowed files are .jpg, .png, .jpeg</small>
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-offset-2 col-sm-2"></label>
					<div class="col-sm-4">
						<button type="submit"
							class="btn btn-primary col-sm-6 col-sm-offset-3">Submit</button>
					</div>
				</div>
			</form>
		</div>

	</div>
</body>
</html>