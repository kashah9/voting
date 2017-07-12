<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.util.*, java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin Page</title>
<link rel="stylesheet" href="/voting/css/bootstrap.min.css">
<script src="/voting/js/jquery-3.2.1.min.js"></script>
<script src="/voting/js/bootstrap.min.js"></script>
<style>
.btn {
	margin-top: 20px;
	color: black;
}

span.label {
	font-size: 1.5em;
}
</style>
</head>

<body>
	<div class="container-fluid">
		<h2 class="page-header text-center">Welcome to the Admin Panel</h2>
		<div class="row">
			<form action="/voting/adminController" method="get">
				<div class="col-md-4 col-md-offset-2">
					<span class="label">Click below to start election </span>
					<button type="submit" id="button1" class="btn btn-primary"
						name="status" value="1">
						<img src="/voting/images/adminOption1.jpg" class="img-thumbnail"
							alt="View Candidate Profiles" width="354" height="250">
					</button>
				</div>

				<div class="col-md-4">
					<span class="label">Click below to stop election</span>
					<button type="submit" class="btn btn-primary" id="button2"
						name="status" value="0">
						<img src="/voting/images/adminOption2.jpg" class="img-thumbnail"
							alt="Go Vote" width="354" height="250">
					</button>
				</div>
			</form>
			</div>
		<button type="button" class="btn btn-primary btn-lg" data-toggle="collapse" data-target="#candTable">Show Candidate
				Profiles!</button>
		<div class="table-responsive collapse" id="candTable">
			<table class="table table-stripped table-hover table-bordered">
			<thead><tr>
				<th>Member ID</th>
				<th>Candidate Name</th>
				<th>Position Name</th>
				<th>Profile Picture</th>
				<th>Description / About</th>
				<th>Address</th>
				<th>Action Needed</th>
			</tr></thead>
			<tbody>
			<tr>
				<%
				try
				{
					Class.forName("com.mysql.jdbc.Driver").newInstance();
					Connection conn = DriverManager
							.getConnection("jdbc:mysql://localhost:3306/evoting?autoReconnect=true&useSSL=false", "root", "");
					System.out.println(this.getClass().getSimpleName() + " Debug: After connection established...");
					Statement st = conn.createStatement();
					String sql = "select c.*, v.FirstName, v.LastName from election_candidatestemp as c inner join voters as v on v.member_id = c.candidate_id";
					System.out.println(this.getClass().getSimpleName()+" Debug2: Join query executed: "+sql);
					ResultSet rs = st.executeQuery(sql);
					while (rs.next()) {
						%>
						
						<td><%=rs.getInt("candidate_id")%></td>
						
						<td><%=rs.getString("FirstName")+" "+rs.getString("LastName") %></td>
						<td><%=rs.getString("position_name")%></td>
						<td>
						<img src="${pageContext.request.contextPath}/images/<%=rs.getString("image_url")%>" height= "100" width="120"/>
						</td>
						<td><%=rs.getString("description")%></td>
						<td><%=rs.getString("address")%></td>
						<td><button type="button" class="btn btn-info btn-sm">Approve</button>
						<button type="button" class="btn btn-info btn-sm">Reject</button></td>
						</tr>
						<% 
					}
				}
				catch(Exception e){
					e.printStackTrace();
				}
				%>
				
				</tbody>
			</table>
		</div>
		
	</div>

</body>
<script>
	// Work on disabling the button...

	/* $('#button1').click(function() {
	 alert('You have started election!');
	 $('#button2').prop('disabled', false);
	 $('#button1').prop('disabled', true);
	 });
	 $('#button2').click(function() {
	 alert('Election has been now stopped!');
	 $('#button2').prop('disabled', true);
	 $('#button1').prop('disabled', false);
	 }); */
</script>
</html>