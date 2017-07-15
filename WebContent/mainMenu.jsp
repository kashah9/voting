<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<style>
#topnav li + a:hover {
  background-color: #ddd;
  color: black;
}
</style>
<body>
	<div class="container">
		<!-- Fixed navbar -->
		<div class="row">
			<nav class="navbar navbar-default navbar-fixed-top">
			<div class="container">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed"
						data-toggle="collapse" data-target="#navbar" aria-expanded="false"
						aria-controls="navbar">
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
				</div>
				<div id="navbar" class="navbar-collapse collapse">
					<ul class="nav navbar-nav">
						<li class="active"><a href="/voting/options.jsp">Home</a></li>
						<li><a href="/voting/candidateProfiles.jsp">Candidate Profiles</a></li>
						<li><a href="/voting/candidateForm.jsp">Candidate Form</a></li>
						<li><a href="#">About</a></li>
						<li><a href="#">Contact</a></li>
						<li><a href="/voting/Logout.jsp"></a></li>
					</ul>
				</div>
				<!--/.nav-collapse -->
			</div>
			</nav>
		</div>
	</div>
	<!-- <script>
		function myFunction() {
			var x = document.getElementById("myTopnav");
			if (x.className === "topnav") {
				x.className += " responsive";
			} else {
				x.className = "topnav";
			}
		}
	</script> -->
</body>
</html>