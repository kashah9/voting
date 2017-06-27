<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="voting.ElectionBean, java.util.*, voting.UserBean"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<link rel="stylesheet" href="/voting/css/ballot.css">
<link rel="stylesheet" href="/voting/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="/voting/js/showPage.js"></script>

<title>Election Page</title>
</head>

<body style="background-color: #FFAE00">
	<div class="votePages" id="form-wrapper">
		<div class="container">
			<h1 class="header-page">Ballot Paper</h1>
			<hr>
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
					<h2 style="text-align: center;">
						Candidates for
						<%=positionName%></h2>
					<div class="row">
						<%
							for (int i = 0; i < candidateList.size(); i++) {
											String[] candidateInfo = candidateList.get(i).split(";");
						%>

						<div
							class="col-sm-4 w3-card w3-left w3-hover-opacity w3-display-container">
							<label id="label1"> <input type="radio"
								name="<%=positionName%>" value="<%=candidateInfo[0]%>"
								onclick="onInputClick('<%=candidateList.get(i)%>', '<%=positionName %>')" /> <figure>
								<div class="w3-card-4" style="width: 100%">
									<img
										src="${pageContext.request.contextPath}/images/<%=candidateInfo[2] %>"
										style="width: 100%;" />
									<div id="candLink" class="w3-container w3-center">
										<a href="candidate.jsp" target="_blank"><p>
												<input type="checkbox" name="<%=candidateInfo[1]%>"
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
								onclick="onInputClick('<%=candidateList.get(j)%>', '<%=positionName %>')" /> <figure>
								<div class="w3-card-4" style="width: 100%">
									<img
										src="${pageContext.request.contextPath}/images/<%=candidateInfo1[2] %>"
										style="width: 100%;" />
									<div id="candLink" class="w3-container w3-center">
										<a href="candidate.jsp" target="_blank"><p>
												<input type="checkbox" name="<%=candidateInfo1[1]%>"
													value="<%=candidateInfo1[1]%>">&emsp;
												<%=candidateInfo1[1]%>
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
							<li class="previous"><a onclick="showLayer('page1')">
									&laquo; Previous</a></li>
							<li><button type="button" value="Submit"
									class="btn btn-primary btn-lg" data-toggle="modal"
									data-target="#myModal" onclick="summary()">Submit Vote</button></li>
						</ul>

					</div>

					<!-- Button trigger modal -->
					<div class="modal fade" id="myModal" tabindex="-1"
						aria-labelledby="exampleModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<h3 class="modal-title" id="exampleModalLabel">Submit Vote</h3>
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
									<input type="submit" class="btn btn-primary"
										value="Submit Vote">
								</div>
							</div>
						</div>
					</div>
				</div>

				<%
					}
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
		//var flag = true;
		var name1;
		var name2;
		function onInputClick(candidate, position) {
			var candidateInfo = candidate.split(";");
			for(var i = 0; i < candidateInfo.length; i++) {
				if(position == "President"){
					name1 = candidateInfo[1];
				}
				if(position == "Chairman"){
					name2 = candidateInfo[1];
				}
			}
		}
		function summary() {

			// for two positions for now (manually add id for each position)
			var selectedVal = "";
			var selectedLabel1 = $("#label1 input[type='radio']:checked");
			var selectedLabel2 = $("#label2 input[type='radio']:checked");
			if (selectedLabel1.length > 0 || selectedLabel2.length > 0) {
				selectedVal1 = selectedLabel1.val();
				selectedVal2 = selectedLabel2.val();
			}
			//console.log();
		document.getElementById('summary').innerHTML = "Your selection Summary <br>"
					+ selectedVal1 + " President -> "+name1 + "<br>" + selectedVal2 + " Chairman -> " + name2;
		}

		$('input:radio').change(function() {
			if ($(this).val() == true) {
				$("#a_next").text('Hello');
			} else {
				$("#a_next").text('Go to Next');
			}
		});
	</script>
</body>
</html>