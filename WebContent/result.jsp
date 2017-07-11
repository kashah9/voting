<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*, java.sql.*, voting.ElectionBean, voting.UserBean"%>
<%
	
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection conn = DriverManager
			.getConnection("jdbc:mysql://localhost:3306/evoting?autoReconnect=true&useSSL=false", "root", "");
	
	Statement st = conn.createStatement();
	String sql = "select t.candidate_id, t.position_name from (select * from election_votes where election_id = 1) as t;";
	ResultSet rs = st.executeQuery(sql);
	HashMap<String, HashMap<Integer, Integer>> vote_map = new HashMap<>();
	while (rs.next()) {
		String position = rs.getString("position_name");
		int candId = rs.getInt("candidate_id");
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
	ElectionBean eBean = (ElectionBean) session.getAttribute("currentElection");
	UserBean uBean = (UserBean) session.getAttribute("currentUser");
	boolean noElection = eBean.getNoElection();
	if (!noElection) {
		
		HashMap<String, ArrayList<String>> positionCandidateMap = eBean.getPositionCandidateMap();
		Set set = positionCandidateMap.keySet();
		Iterator itr = set.iterator();
		while (itr.hasNext()) {
			
			String positionName = (String) itr.next();
			ArrayList<String> candidateList = positionCandidateMap.get(positionName);
			for(int i = 0; i<candidateList.size(); i++){
				candidateInfo = candidateList.get(i).split(";");
				
			}
		}
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Election Results</title>
<link rel="stylesheet" href="/voting/css/bootstrap.min.css">
<link rel="stylesheet" href="/voting/css/result.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script src="/voting/js/jquery-3.2.1.min.js"></script>
<script src="/voting/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
	<table class="table table-striped table-bordered table-hover">
	<tr>
		<th>Candidate ID</th>
		<th>Number of Votes</th>
		<th>Candidate Name</th>
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
						<td><%=cId%></td>
						<td><%=vCount %></td>
						<td><%=candidateInfo[1] %>
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
	<div class="container-fluid">
		<div class="winner-header container";>
			<div id="header">

				<h1 id="borderimg" class="w3-myFont">
					<img src="/voting/images/ribbon.png" height="50px" width="50px" />
					Winners for Election! <img src="/voting/images/ribbon.png"
						height="50px" width="50px" />
				</h1>

			</div>
		</div>

		<div class="container">
			<ul class="w3-ul w3-card-4">
				<li
					class="w3-panel w3-padding-24 w3-border w3-border-red w3-light-grey w3-hover-grey w3-round-large">
					<img src="/voting/images/grad4201706220238255.jpg"
					class="w3-left w3-circle w3-margin-right" style="width: 80px">
					<span class="w3-large w3-text-blue">Jessica Bell</span>
				<span class="w3-right w3-xlarge w3-text-red w3-animate-opacity">President</span>
				</li>
				<li
					class="w3-panel w3-padding-24 w3-border w3-border-red w3-light-grey w3-hover-grey w3-round-large">
					<img src="/voting/images/grad4201706220238255.jpg"
					class="w3-left w3-circle w3-margin-right" style="width: 80px">
					<span class="w3-large w3-text-blue">Martha McClamb</span>
				<span class="w3-right w3-xlarge w3-text-red w3-animate-opacity">Chairman</span>
				</li>
			</ul>
		</div>
	</div>
</body>
</html>