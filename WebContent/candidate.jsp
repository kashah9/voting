<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="voting.ElectionBean, java.util.*, voting.UserBean"%>
<html lang="en">
  <head>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Candidate Profiles</title>
	
   	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
   	<link rel="stylesheet" href="/voting/css/custom.css">
   	<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
   	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    </head>
    <body>
    <div id="wrapper">
	<div class="nav-side-menu">
	    <div class="brand">JCNJ Election</div>
	    <i class="fa fa-bars fa-2x toggle-btn" data-toggle="collapse" data-target="#menu-content"></i>
	  
	        <div class="menu-list">
	        <ul id="menu-content" class="menu-content collapse out">
	        
	
    <%
    ElectionBean eBean = (ElectionBean) session.getAttribute("currentElection");
    boolean noElection = eBean.getNoElection();
	if(!noElection){
	
		HashMap<String, ArrayList<String>> positionCandidateMap = eBean.getPositionCandidateMap();
		Set set = positionCandidateMap.keySet();
		Iterator itr = set.iterator();
		while(itr.hasNext())
		{
			
			String positionName = (String)itr.next();
			ArrayList<String> candidateList = positionCandidateMap.get(positionName);
			%>
			 <li data-toggle="collapse" data-target="#president" class="collapsed">
	         	<a href="#"><i class="fa fa-globe fa-lg"></i><%=positionName%> <span class="arrow"></span></a>
	         </li>
			<% 
			for(String candidate: candidateList)
			{
				String[] candidateInfo = candidate.split(";");
			%>
				
			<ul class="sub-menu collapse" id="president">
                 <li data-target="#test"><%=candidateInfo[1]%></li>
                 <li><%=candidateInfo[1]%></li>
                 <li><%=candidateInfo[1]%></li>
            </ul>
            <%
			}
	    }
	
    	%>
      
					<li data-toggle="collapse" data-target="#service" class="collapsed">
	                  <a href="#"><i class="fa fa-globe fa-lg"></i> Services <span class="arrow"></span></a>
	                </li>  
	                <ul class="sub-menu collapse" id="service">
	                  <li>New Service 1</li>
	                  <li>New Service 2</li>
	                  <li>New Service 3</li>
	                </ul>
	
	
	                <li data-toggle="collapse" data-target="#new" class="collapsed">
	                  <a href="#"><i class="fa fa-car fa-lg"></i> New <span class="arrow"></span></a>
	                </li>
	                <ul class="sub-menu collapse" id="new">
	                  <li>New New 1</li>
	                  <li>New New 2</li>
	                  <li>New New 3</li>
	                </ul>
	
	
	                 <li>
	                  <a href="#">
	                  <i class="fa fa-user fa-lg"></i> Profile
	                  </a>
	                  </li>
	
	                 <li>
	                  <a href="#">
	                  <i class="fa fa-users fa-lg"></i> Users
	                  </a>
	                </li>
	            </ul>
	     </div>
		
	</div>
	<div id="page-content-wrapper">
		<h1>Hello JCNJ Candidate</h1>
	</div>
	
	<div id="test" style="display: none">
		<h1>Hello JCNJ Candidate</h1>
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