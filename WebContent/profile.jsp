<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="voting.ElectionBean, java.util.*, voting.UserBean"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

	<link rel="stylesheet" href="/voting/css/ballot.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="/voting/js/showPage.js"></script>
	
	<title>Election Page</title>
</head>

<body style="background-color: #FFAE00">
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
	<h2 style="text-align: center;">Candidates for <%=positionName %></h2>
	<%
		for(String candidate: candidateList)
		{
			String[] candidateInfo = candidate.split(";");
			/* System.out.println("Hi"+candidateInfo[2]);
			System.out.println("Hi"+candidateInfo[3]);
			System.out.println("Hi"+candidateInfo[4]); */
		%>
			
			<div class="col-sm-4 w3-card w3-left w3-hover-opacity w3-display-container">
			<label>
		    	<input type="radio" name="<%=positionName%>" value="<%=candidateInfo[0]%>" />
		    	<figure>
		    		<div class="w3-card-4" style="width:100%">
		    		<img src="${pageContext.request.contextPath}/images/<%=candidateInfo[2] %>" style="width:100%;"/>
		    		<div class="w3-container w3-center">
		    			<p><%=candidateInfo[1]%></p>
		    		</div>
		    		</div>
		    	</figure>
		  	</label>
		  	</div>
		  	<%-- <input type="hidden" name="description" value="<%=candidateInfo[3]%>">
		  	<input type="hidden" name="address" value="<%=candidateInfo[4]%>"> --%>
			<input type="hidden" name="electionID" value="<%=(int)eBean.getElectionId() %>">
			<input type="hidden" name="member_id" value="<%=(int)uBean.getMember_id() %>">
		<%
			}
		%>
		<div class="button">
	    	<!-- <input type="button" value="Save" class="previous" onclick="showLayer('page2');">
	    	<input type="button" value="Save" class="next" onclick="showLayer('page2');"> -->
	    	<ul class="pager">
			    <li class="previous"><a onclick="showLayer('page2')"> &laquo; Previous</a></li>
			    <li class="next"><a onclick="showLayer('page2')"> &raquo; Next</a></li>
	  		</ul>
	    </div>
	</div>
		
		<% 
		}
	
		if(positionName.equals("Chairman")){	
	%>
	<div id="page2" class="page">
	<h2 style="text-align: center;">Candidates for <%=positionName %></h2>
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
		    		<img src="${pageContext.request.contextPath}/images/<%=candidateInfo1[2] %>" style="width:100%;"/>
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
			<!-- <div class="button">
			<ul class="pager">
				<li class="previous"><a onclick="showLayer('page1')"> &laquo; Previous</a></li>
			</ul>
				<input type="submit" class="btn btn-default" value="Submit">
			</div> -->
			<!-- Button trigger modal -->
			<ul class="pager"><li class="previous"><a onclick="showLayer('page1')"> &laquo; Previous</a></li></ul>
		 	<button type="button" value="Submit" class="btn btn-primary" data-toggle="modal" data-target="#myModal">Submit Vote</button>
			<div class="modal fade" id="myModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			  <div class="modal-dialog">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h3 class="modal-title" id="exampleModalLabel">Submit Vote</h3>
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			          <span aria-hidden="true">&times;</span>
			        </button>
			      </div>
			      <div class="modal-body">
			        <p>Do you really want to SUBMIT the vote???</p>
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
			        <input type="submit" class="btn btn-primary" value="Submit Vote">
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
	
	else
	{
		%>
		<h1>No Election in Progress! Come back later....</h1>
		<%
	}
%>
<%@include file="footer.jsp" %>
</body>
</html>