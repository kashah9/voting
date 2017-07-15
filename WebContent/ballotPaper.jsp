<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="voting.ElectionBean, java.util.*, voting.UserBean"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Election Page</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="/voting/css/ballot.css">
<link rel="stylesheet" href="/voting/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style>

.card {
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
	transition: 0.3s;
	width: 30%;
	border-radius: 5px;
}

.card:hover {
	box-shadow: 0 8px 16px 0 rgba(0, 0, 0, 0.2);
}

img {
	border-radius: 5px 5px 0 0;
}
</style>
</head>

<%
	// Disabling the browser back button which fetches data from cache memory
	response.setHeader("Cache-Control", "no-cache"); // Forces caches to obtain a new copy of the page from the origin server
	response.setHeader("Cache-Control", "no-store"); // Directs caches not to store the page under any circumstance
	response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"
%>

<body style="background-color: #FFAE00">
	<div class="container" id="form-wrapper">
		<%@include file="mainMenu.jsp"%>
		<h1 class="header-page">Ballot Paper</h1>
		<hr>
		<div class="container">
			<form action="thankYou.jsp" class="voteForm" method="post">

				<%
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
							if (positionName.equals("President")) {
				%>

				<div id="page1" class="page" style="visibility: visible;">
					<div class="row">
						<div class="col-md-4">
							<p style="align: center; font-size: 2vw;">
								Candidates for
								<%=positionName%></p>
						</div>

					</div>

					<div class="row">
						<%
							for (int i = 0; i < candidateList.size(); i++) {
											String[] candidateInfo = candidateList.get(i).split(";");
						%>

						<div
							class="col-sm-4 w3-card w3-left w3-hover-opacity w3-display-container">
							<label id="label1"> <input type="radio"
								name="<%=positionName%>" value="<%=candidateInfo[0]%>"
								onclick="onInputClick('<%=candidateList.get(i)%>', '<%=positionName%>')" />
								<figure>
								<div class="w3-card-4" style="width: 100%">
									<img
										src="${pageContext.request.contextPath}/images/<%=candidateInfo[2] %>"
										style="width: 100%;" />
									<div id="candLink" class="w3-container w3-center">
										<a href="candidate.jsp" target="_blank"><p>
												<input  type="radio" name="<%=candidateInfo[1]%>"
													value="<%=candidateInfo[1]%>">&emsp;
												<%=candidateInfo[1]%>
											</p></a>
									</div>
								</div>
								</figure>
							</label>
						</div>

						<input type="hidden" name="electionID"
							value="<%=(int) eBean.getElectionId()%>"> <input
							type="hidden" name="member_id"
							value="<%=(int) uBean.getMember_id()%>">

						<%
							}
						%>
					</div>
					<div class="button row">
						<ul class="pager">

							<li class="next"><a id="a_next" onclick="showLayer('page2')">
									Skip / No Trust &raquo; </a></li>
						</ul>
					</div>
				</div>

				<%
					}

							if (positionName.equals("Chairman")) {
				%>
				<div id="page2" class="page">
					<h2 style="text-align: center;">
						Candidates for
						<%=positionName%></h2>
					<div class="row">
						<%
							for (int j = 0; j < candidateList.size(); j++) {
											String[] candidateInfo1 = candidateList.get(j).split(";");
						%>
						<div
							class="col-sm-4 w3-card w3-left w3-hover-opacity w3-display-container">
							<label id="label2"> <input id="r1" type="radio"
								name="<%=positionName%>" value="<%=candidateInfo1[0]%>"
								onclick="onInputClick('<%=candidateList.get(j)%>', '<%=positionName%>')" />
								<figure>
								<div class="w3-card-4" style="width: 100%">
									<img
										src="${pageContext.request.contextPath}/images/<%=candidateInfo1[2] %>"
										style="width: 100%;" />
									<div id="candLink" class="w3-container w3-center">
										<a href="candidate.jsp" target="_blank"><p>
												<input type="radio" name="<%=candidateInfo1[1]%>"
													value="<%=candidateInfo1[1]%>">&emsp;
												<%=candidateInfo1[1]%>
											</p></a>
									</div>
								</div>
								</figure>
							</label>
						</div>

						<input type="hidden" name="electionID"
							value="<%=(int) eBean.getElectionId()%>">
						<input
							type="hidden" name="member_id"
							value="<%=(int) uBean.getMember_id()%>">
						<%
							}
						%>
					</div>
					<div class="button row">
						<ul class="pager">
							<li class="previous"><a onclick="showLayer('page1')">
									&laquo; Previous</a></li>

							<li class="next"><a id="a_next2"
								onclick="showLayer('page3')"> Skip / No Trust &raquo; </a></li>
						</ul>

					</div>
				</div>
				<%
					}
							if (positionName.equals("EC")) {
				%>

				<div id="page3" class="page">

					<h2 style="text-align: center;">
						Candidates for
						<%=positionName%></h2>

					<div id="Counter">
						<p>You have selected 0 candidate(s)!</p>
					</div>
					<div class="table-responsive">
						<table class="table table-stripped table-bordered"
							style="font-family: Comic Sans MS, cursive, sans-serif !important;">
							<thead>
								<tr>
									<th class="col-md-4">Profile of Candidates</th>
									<th class="col-sm-4">Candidate Name</th>
									<th class="col-sm-4">Vote Selection</th>
								</tr>
							</thead>
							<tbody>


								<%
									for (int j = 0; j < candidateList.size(); j++) {
													String[] candidateInfo2 = candidateList.get(j).split(";");
								%>
								<tr>
									<td>
										<div class="card">
											<img
												src="${pageContext.request.contextPath}/images/<%=candidateInfo2[2] %>"
												style="width: 100%;" />
										</div>
									</td>
									<td><a href="candidate.jsp" target="_blank">
											<h3>
												<%=candidateInfo2[1]%>
											</h3>
									</a></td>
									<td><input type="checkbox" class="checkbox"
										name="<%=positionName%>" value="<%=candidateInfo2[0]%>" id="checkbox1">
									<input type="hidden" id="checkBox"
										value="<%=candidateInfo2[1]%>"> 
									</td>
								</tr>
						
								<%
									}
								%>
							</tbody>
						</table>
					</div>
					
					<input type="hidden" name="electionID"
							value="<%=(int) eBean.getElectionId()%>"> 
					<input type="hidden" name="member_id"
							value="<%=(int) uBean.getMember_id()%>">
					
				<div class="button row">
						<ul class="pager">
							<li class="previous"><a onclick="showLayer('page2')">
									&laquo; Previous</a></li>
							<li><button type="button" value="Submit"
									class="btn btn-primary btn-lg" data-toggle="modal"
									data-target="#myModal" onclick="summary()">Submit Vote</button></li>
						</ul>
					</div>
				</div>

				<%
					}
				%>
						<!-- Button trigger modal -->
				<div class="modal fade" id="myModal" tabindex="-1"
					aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<h3 class="modal-title" id="exampleModalLabel">Selection Summary</h3>
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body">
								<p id="summary"></p>
								<p>Do you really want to SUBMIT the vote???</p>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-dismiss="modal">Cancel</button>
								<input type="submit" class="btn btn-primary" value="Submit Vote">
							</div>
						</div>
					</div>
				</div>
						
						<% 
						}
				%>
			</form>
		</div>
	</div>
	<%
		}

		else {
	%>
	<h1>No Election in Progress! Please come back later....</h1>
	<%
		}
	%>
	<script>
		$('input:radio').change(function() {
			if ($(this).val() == true) {
				$("#a_next").text('Sample');
			} else {
				$("#a_next").text('Go to Next');
				$("#a_next2").text('Go to Next');
			}
		});

		var counterCandidates = 0;
		$('.checkbox').on(
				'click',
				function() {
					if (this.checked) {
						counterCandidates++;
					} else {
						counterCandidates--;
					}
					$('#Counter').html(
							'You have selected ' + counterCandidates
									+ ' candidate(s)!');
				})
	</script>
	<script src="/voting/js/ballot.js"></script>
</body>
</html>