<%@ page import="com.Ecom.model.User" %>
<!DOCTYPE html>
<html lang="en">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Personal Center</title>
	<link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
	<link href="../css/mystyle.css" rel="stylesheet">

  </head>

<body>
	<div class="container">
	<jsp:include page="../Shared/_Layout.jsp" />
	<div class="row clearfix">
	<div class="col-md-3 column">
		<%
			User user = (User)session.getAttribute("user");
			String email = user.getEmail();
		%>
		<div class="auto-fix-img">
			<img height="100px" width="100px" src="http://localhost:8080/userimage/<%=email%>/image">
		</div>
		<br/>
		<div class="panel-group" id="accordion">
		<div class="panel panel-default">
			<div class="panel-heading">
				<h4 class="panel-title">
					<a data-toggle="collapse" data-parent="#accordion" 
				   	href="#collapseOne">
						User Management
					</a>
				</h4>
			</div>
			<div id="collapseOne" class="panel-collapse collapse in">
				<div class="panel-body">
					<a href="../User/ModifySelfInfo.jsp">Modify Self Information</a>
				</div>
				<div class="panel-body">
					<a href="../User/ModifySelfPwd.jsp">Modify Password</a>
				</div>
				<div class="panel-body">
					<a href="../User/ModifySelfPic.jsp">Modify Profile</a>
				</div>
				<div class="panel-body">
					<a href="../User/ModifySelfPayPwd.jsp">Modify Pay Password</a>
				</div>
				<div class="panel-body">
					<a href="../User/ManageSelfAddress.jsp">Modify Address</a>
				</div>
			</div>
		</div>
		
		<div class="panel panel-default">
			<div class="panel-heading">
				<h4 class="panel-title">
					<a data-toggle="collapse" data-parent="#accordion" 
				   	href="#collapseTwo">
						View My Order
					</a>
				</h4>
			</div>
			<div id="collapseTwo" class="panel-collapse collapse">
				<div class="panel-body">
					<a href="../User/SelfOrder.jsp">All Orders</a>
				</div>
				<div class="panel-body">
					<a href="../User/SelfOrderWaitForSend.jsp">Wait for sending</a>
				</div>
				<div class="panel-body">
					<a href="../User/SelfOrderWaitForReceive.jsp">Wait for receiving</a>
				</div>
				<div class="panel-body">
					<a href="../User/SelfOrderWaitForComment.jsp">Wait for Comment</a>
				</div>
			</div>
		</div>
		</div>
	</div>
	<div class="col-md-9 column">	
