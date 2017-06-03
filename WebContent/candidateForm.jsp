<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="voting.ElectionBean, java.util.*, voting.UserBean"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Candidate Form Page</title>

		<link rel="stylesheet" href="/voting/css/bootstrap.min.css">
        <script src="/voting/js/jquery-3.2.1.min.js"></script>
        <link rel="stylesheet" href="/voting/css/login.css">
        <script src="/voting/js/bootstrap.min.js"></script>
</head>
<body>
		<div class="jumbotron" id="form-wrapper">
		<div class="container">
		<h2 class="page-header">JCNJ: Candidate Profile</h2>
		<% 
		ElectionBean eBean = (ElectionBean) session.getAttribute("currentElection");
		HashMap<String, ArrayList<String>> positionCandidateMap = eBean.getPositionCandidateMap();
		Set set = positionCandidateMap.keySet();
		Iterator itr = set.iterator();
		%>
           <form class="form-horizontal" action="/voting/FileUploadController" method="post" enctype="multipart/form-data">
            <div class="form-group row">
	      		<label class="col-sm-2 col-sm-offset-2 control-label">Address</label>
	      		<div class="col-sm-4"><input type="text" name="address" class="form-control"/></div>
		    </div>
		    <div class="form-group row">
		    <label class="col-sm-2 col-sm-offset-2 control-label">Position Name</label>
		    <div class="col-sm-4">
		    
			    <select class="form-control" name="position_name">
					 <%
					 	while(itr.hasNext()){
					 		String positionName = (String)itr.next();
					 		%><option value="<%=positionName%>"><%=positionName%></option><%
					 	}
					 %>
				</select>
			</div>
			</div>
					    
           	<div class="form-group row">
           		<label class="col-sm-2 col-sm-offset-2 control-label">Enter Profile</label>
           		<div class="col-sm-4"><input type="text" name="profile" class="form-control"/></div>
           	</div>
            <div class="form-group row">
           		<label class="col-sm-2 col-sm-offset-2 control-label">Upload Image</label>
           		<div class="col-sm-4">
           			<input type="file" name="file" class="form-control-file"/>
           			<small class="form-text text-muted">Please upload the image, allowed files are .jpg, .png, .jpeg</small>
                </div>
           	</div>
            <div class="form-group row">        
		      <div class="col-sm-offset-4 col-sm-2">
		        <button type="submit" class="btn btn-primary">Submit</button>
		      </div>
		    </div>
            </form>          
        </div>
        </div>
</body>
</html>