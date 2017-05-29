<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="voting.ElectionBean, java.util.*, voting.UserBean"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link rel="stylesheet" href="/voting/css/ballot.css">
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Election Page</title>

<script>

var currentLayer = 'page1';

function showLayer(lyr) {
    hideLayer(currentLayer);
    document.getElementById(lyr).style.visibility = 'visible';
    currentLayer = lyr;
    console.log("Function called");
}

function hideLayer(lyr) {
    document.getElementById(lyr).style.visibility = 'hidden';
}

</script>

</head>
<body>
	<div class="votePages" id="form-wrapper">
        <div class="container">
            <h1 class="header-page">Ballot Paper</h1><hr>
			<form action="/voting/VotingController" class="voteForm" method="post">
			
	<% 
	ElectionBean eBean = (ElectionBean) session.getAttribute("currentElection");
	UserBean uBean = (UserBean) session.getAttribute("currentUser");
	boolean noElection = eBean.getNoElection();
	if(!noElection)
	{
		
		HashMap<String, ArrayList<String>> positionCandidateMap = eBean.getPositionCandidateMap();
		Set set = positionCandidateMap.keySet();
		Iterator itr = set.iterator();
		while(itr.hasNext())
		{
			
			String positionName = (String)itr.next();
			ArrayList<String> candidateList = positionCandidateMap.get(positionName);
			if(positionName.equals("President")){
				
	%>
	<div id = "page1" class="page" style="visibility: visible;">
	<label class="label"><%=positionName %></label>
	<%
		for(String candidate: candidateList)
		{
			String[] candidateInfo = candidate.split(";");
			
		%>
			
			<div class="col-sm-4 w3-card w3-left w3-hover-opacity w3-display-container">
			<label>
		    	<input type="radio" name="<%=positionName%>" value="<%=candidateInfo[0]%>" />
		    	<figure>
		    		<div class="w3-card-4" style="width:100%">
		    		<img src="<%=candidateInfo[2]%>" style="width:100%">
		    		<div class="w3-container w3-center">
		    			<p><%=candidateInfo[1] %></p>
		    		</div>
		    		</div>
		    	</figure>
		  	</label>
		  	</div>
			<input type="hidden" name="electionID" value="<%=(int)eBean.getElectionId() %>">
			<input type="hidden" name="member_id" value="<%=(int)uBean.getMember_id() %>">
		<%
			}
		%>
		<div class="button">
	    	<input type="button" value="Save" onclick="showLayer('page2');">
	    </div>
	</div>
		
		<% 
		}
	
		if(positionName.equals("Chairman")){	
	%>
	<div id="page2" class="page">
	<label class="label"><%=positionName%></label>
	<%
				for(String candidate1: candidateList)
				{
					String[] candidateInfo1 = candidate1.split(";");
		%>
			<div class="col-sm-4 w3-card w3-left w3-hover-opacity w3-display-container">
			<label>
		    	<input type="radio" name="<%=positionName%>" value="<%=candidateInfo1[0]%>" />
		    	<figure>
		    		<div class="w3-card-4" style="width:100%">
		    		<img src="<%=candidateInfo1[2]%>" style="width:100%">
		    		<div class="w3-container w3-center">
		    			<p><%=candidateInfo1[1] %></p>
		    		</div>
		    		</div>
		    	</figure>
		  	</label>
			</div>
			<input type="hidden" name="electionID" value="<%=(int)eBean.getElectionId() %>">
			<input type="hidden" name="member_id" value="<%=(int)uBean.getMember_id() %>">
			<%
					}
		    %>
			<div class="button">
				<input type="submit" value="Submit">
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
	
	else
	{
		%>
		<h1>No Election in Progress! Come back later....</h1>
		<%
	}
%>
</body>
</html>