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
   	<script>
   	
    function showProfile(item) {
    	
    	<%
    	String str = "document.writeln(item)";
    	out.println("Debug:"+str);
    	%>
        //var divs = document.getElementsByClassName("newscontainer");
        //for (var i = 0; i < divs.length; i++) {
        //    divs[i].style.display = 'none';
        //}
        //var myDiv = item.href;
        //var target = myDiv.split("#");
        //document.getElementById(target[1]).style.display = "block";
    }
   	</script>
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
		    
			HashMap<String, ArrayList<String>> positionCandidateMap = eBean.getPositionCandidateMap();
			Set set = positionCandidateMap.keySet();
			Iterator itr = set.iterator();
				
			while(itr.hasNext())
			{
				String positionName = (String)itr.next();
				ArrayList<String> candidateList = positionCandidateMap.get(positionName);
				%>
					
				<!-- class="collapsed" add this to li tag to hide the content -->
				<li data-toggle="collapse" data-target="#<%=positionName%>">
		         	<a href="#"><i class="fa fa-user fa-lg"></i><%=positionName%> <span class="arrow"></span></a>
		         </li>
		        <ul class="sub-menu" id=<%=positionName%>>
				<% 
					for(String candidate: candidateList)
					{
						String[] candidateInfo = candidate.split(";");
					%>
						<li><a href="#" onclick="showProfile(<%=candidateInfo[0]%>)" class="tab1"><%=candidateInfo[1]%></a></li>
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
	
	<div id="" class="newscontainer tab1">
	
	</div>
    <div id="page-content-wrapper" class="newscontainer tab2">TAB2 CLCIKED</div>
	<%@include file="footer.jsp" %>
	</div>
</body>
</html>