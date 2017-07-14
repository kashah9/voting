<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="java.util.*, java.sql.*, voting.UserBean, voting.ElectionBean"%>

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
<%
	UserBean uBean = (UserBean) session.getAttribute("currentUser");
	if(uBean.isFlag() == true){
		
	
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection conn = DriverManager
			.getConnection("jdbc:mysql://localhost:3306/evoting?autoReconnect=true&useSSL=false", "root", "");

	Statement st = conn.createStatement();
	String sql = "select t.candidate_id, t.position_name from (select * from election_votes where election_id = 1) as t;";
	ResultSet rs1 = st.executeQuery(sql);
	HashMap<String, HashMap<Integer, Integer>> vote_map = new HashMap<>();
	while (rs1.next()) {
		String position = rs1.getString("position_name");
		int candId = rs1.getInt("candidate_id");
		if (vote_map.containsKey(position)) {
			HashMap<Integer, Integer> hmap = vote_map.get(position);
			if (hmap.containsKey(candId)) {
				int votes = hmap.get(candId);
				votes += 1;
				hmap.put(candId, votes);
			} else {
				hmap.put(candId, 1);
			}
		} else {
			HashMap<Integer, Integer> hmap = new HashMap<>();
			hmap.put(candId, 1);
			vote_map.put(position, hmap);
		}

	}
	String[] candidateInfo = null;
	HashMap<Integer, String> candIdName = new HashMap<>();
	ElectionBean eBean = (ElectionBean) session.getAttribute("currentElection");
	
	boolean noElection = eBean.getNoElection();
	if (!noElection) {

		HashMap<String, ArrayList<String>> positionCandidateMap = eBean.getPositionCandidateMap();
		Set set = positionCandidateMap.keySet();
		Iterator itr = set.iterator();
		while (itr.hasNext()) {

			String positionName = (String) itr.next();
			ArrayList<String> candidateList = positionCandidateMap.get(positionName);
			for (int i = 0; i < candidateList.size(); i++) {
				//candidateInfo = candidateList.get(i).split(";")[1];
				candIdName.put(Integer.parseInt(candidateList.get(i).split(";")[0]),
						candidateList.get(i).split(";")[1]);

			}
		}
	}
%>
	<body>
	<div class="container-fluid">
		<h2 class="text-center">Welcome to the Admin Panel</h2>
		<div class="row">
			<form action="/voting/adminController" method="post" name="form">

				<div class="col-md-4">
					<button type="submit" id="button1" class="btn btn-primary"
						name="status" value="1">
						<img src="/voting/images/adminOption1.jpg" class="img-thumbnail"
							alt="View Candidate Profiles" width="304" height="200">
					</button>
				</div>

				<div class="col-md-4">
					<button type="submit" class="btn btn-primary" id="button2"
						name="status" value="0">
						<img src="/voting/images/adminOption2.jpg" class="img-thumbnail"
							alt="Go Vote" width="304" height="200">
					</button>
				</div>
				<div class="col-md-4">
					<a type="button" class="btn btn-primary" id="button3"
						href="/voting/ballotPaper.jsp"><img
						src="/voting/images/options2.jpg" class="img-thumbnail"
						alt="Go Vote" width="304" height="200"></a>
				</div>
				</form>
		</div>
		
		<div class="row">
			<button type="button"
				class="col-md-4 col-md-offset-1 btn btn-primary btn-lg"
				data-toggle="collapse" data-target="#candTable">Show
				Pending Candidate Profiles!</button>
			<button type="button" class="col-md-4 col-md-offset-1 btn btn-primary btn-lg"
				data-toggle="collapse" data-target="#resultTable">Full
				Results Summary</button>
		</div>
		<div class="table-responsive collapse" id="candTable">
			<table class="table table-striped table-hover table-bordered">
				<thead>
					<tr>
						<th>Member ID</th>
						<th>Candidate Name</th>
						<th>Position Name</th>
						<th>Profile Picture</th>
						<th>Description / About</th>
						<th>Address</th>
						<th>Action Needed</th>
					</tr>
				</thead>
				<tbody>
						
						<%
							try {
								Class.forName("com.mysql.jdbc.Driver").newInstance();
								conn = DriverManager.getConnection(
										"jdbc:mysql://localhost:3306/evoting?autoReconnect=true&useSSL=false", "root", "");
								System.out.println(this.getClass().getSimpleName() + " Debug: After connection established...");
								st = conn.createStatement();
								String sql1 = "select c.*, v.FirstName, v.LastName from election_candidatestemp as c inner join voters as v on v.member_id = c.candidate_id";
								System.out.println(this.getClass().getSimpleName() + " Debug2: Join query executed:");
								ResultSet rs = st.executeQuery(sql1);
								int count = 0;
								while (rs.next()) {
						%>

					<form action="/voting/adminController" method="post">
						<tr>
							<td><%=rs.getInt("candidate_id")%></td> 
							
							<td><%=rs.getString("FirstName") + " " + rs.getString("LastName")%></td>

							
							<td><%=rs.getString("position_name")%></td> 
							<td><img
								src="${pageContext.request.contextPath}/images/<%=rs.getString("image_url")%>"
								height="100" width="120" /></td> 
							<td><%=rs.getString("description")%></td> 
							<td><%=rs.getString("address")%></td>
							<td>
								<button type="submit" class="btn btn-info btn-sm" name="Approve"
									value="yes">Approve</button>
								<button type="submit" class="btn btn-info btn-sm" name="Reject"
									value="no">Reject</button>
							</td>
						</tr>
							<input type="hidden" name="candidate_id"
								value="<%=rs.getInt("candidate_id")%>">
							<input type="hidden"
								name="candidate_name"
								value="<%=rs.getString("FirstName") + " " + rs.getString("LastName")%>" />
							<input type="hidden" name="position_name"
								value="<%=rs.getString("position_name")%>" />
							<input type="hidden"
								name="image" value="<%=rs.getString("image_url")%>" />
							<input type="hidden"
								name="description" value="<%=rs.getString("description")%>" />
								<input type="hidden"
								name="address" value="<%=rs.getString("address")%>" />
					</form>

					<%
							}
					
						} catch (Exception e) {
							e.printStackTrace();
						}
					%>

				</tbody>
			</table>

		</div>
		<div class="table-responsive collapse" id="resultTable">
			<table class="table table-striped table-bordered table-hover">
				<tr>
					<th>Candidate Name</th>
					<th>Number of Votes</th>
					<th>Position Name</th>
				</tr>
				<%
					Set set = vote_map.keySet();
					Iterator itr = set.iterator();
					HashMap<String, Integer> winner_map = new HashMap<>();
					while (itr.hasNext()) {
						int current_max = -1;
						int current_winner = -1;
						String posName = (String) itr.next();
						HashMap<Integer, Integer> voteMap = vote_map.get(posName);
						Set s = voteMap.entrySet();
						Iterator it = s.iterator();
						while (it.hasNext()) {
							Map.Entry e = (Map.Entry) it.next();
							int cId = (int) e.getKey();
							int vCount = (int) e.getValue();
				%>
				<tr>
					<td><%=candIdName.get(cId)%>
					<td><%=vCount%></td>
					<td><%=posName %></td>
					
				</tr>
				<%
					if (vCount > current_max) {
								current_winner = cId;
							}
						}
						winner_map.put(posName, current_winner);
					}
				%>


			</table>
		</div>
	</div>

</body>
	<% 
		} 
	else {
	%>
		<jsp:forward page = "ErrorPage.jsp"/>
	<%
		}
	%>
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