<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="voting.ElectionBean, java.util.*, voting.UserBean"%>
<html lang="en">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Candidate Profiles</title>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="/voting/css/candidate.css">
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script>
	$(document).ready(function() {
		$("#profile").children().hide();
		$('#welcome').show();
	});
	function showProfile(id) {
		$("#profile").children().hide();
		$(id).show();
		$('#welcome').hide();
	}
</script>

</head>
<body>
	<div class="container-fluid row">
		<div class="nav-side-menu">
			<div class="brand">JCNJ Election</div>
			<i class="fa fa-bars fa-2x toggle-btn" data-toggle="collapse"
				data-target="#menu-content"></i>

			<div class="menu-list">
				<ul id="menu-content" class="menu-content collapse out">


					<%
						ElectionBean eBean = (ElectionBean) session.getAttribute("currentElection");

						HashMap<String, ArrayList<String>> positionCandidateMap = eBean.getPositionCandidateMap();
						Set set = positionCandidateMap.keySet();
						Iterator itr = set.iterator();

						int i = 0;
						while (itr.hasNext()) {
							String positionName = (String) itr.next();
							ArrayList<String> candidateList = positionCandidateMap.get(positionName);
					%>

					<!-- class="collapsed" add this to li tag to hide the content -->
					<li data-toggle="collapse" data-target="#<%=positionName%>"><a
						href="#"><i class="fa fa-user fa-lg"></i><%=positionName%> <span
							class="arrow"></span></a></li>
					<ul class="sub-menu" id=<%=positionName%>>
						<%
							for (String candidate : candidateList) {
									String[] candidateInfo = candidate.split(";");
						%>
						<li><a href="#profile" class="tab1"
							onclick="showProfile('#profile<%=i%>')"><%=candidateInfo[1]%></a></li>
						<%
							i++;
						%>
						<%
							}
						%>
					</ul>

					<%
						}
					%>
				</ul>
			</div>
		</div>

		<!-- page-content col-sm-9 -->
		<div id="profile" class="page-content col-sm-9">
			<%
				positionCandidateMap = eBean.getPositionCandidateMap();
				set = positionCandidateMap.keySet();
				itr = set.iterator();

				i = 0;
				while (itr.hasNext()) {
					String positionName = (String) itr.next();
					ArrayList<String> candidateList = positionCandidateMap.get(positionName);

					//System.out.println("vote"+candidateList.get(0));

					for (String candidate : candidateList) {
						String[] candidateInfo = candidate.split(";");
			%>

			<div id="profile<%=i%>">

				<div class="media">
					<div class="media-left">
						<img src="/voting/images/<%=candidateInfo[2]%>"
							alt="Candidate Image shold be displayed here"
							class="media-object" width="400px">
						<h4 class="media-heading"><%=candidateInfo[1]%></h4>
					</div>
					<div class="media-body">
						Profile Information:
						<p style="position: absolute; margin-top: 10px;"><%=candidateInfo[3]%></p>
					</div>
				</div>
			</div>
			<%
				i++;
			%>

			<%
					}
				}
			%>
		</div>

		<div id="welcome" class="col-sm-9 welcome-page">
			<h1 class="cand-header">Welcome to Candidate Profiles!</h1>

			<img src="/voting/images/derasar.jpg" class="media-object"
				width="400px">
		</div>
		<%@include file="footer.jsp"%>
	</div>
</body>
</html>