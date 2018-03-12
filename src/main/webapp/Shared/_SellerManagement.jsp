<!DOCTYPE html>
<html lang="en">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Management</title>
	<link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
	<link href="../css/mystyle.css" rel="stylesheet">
  </head>

<body>
	<div class="container">
	<jsp:include page="../Shared/_Layout.jsp" />
	<div class="row clearfix">
	<div class="col-md-3 column">
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
					<a href="../Seller/ModifySelfInfo.jsp">Modify SelfInformation</a>
				</div>
				<div class="panel-body">
					<a href="../Seller/ModifySelfPayPwd.jsp">Modify password</a>
				</div>
			</div>
		</div>
		
		<div class="panel panel-default">
			<div class="panel-heading">
				<h4 class="panel-title">
					<a data-toggle="collapse" data-parent="#accordion" 
				   	href="#collapseTwo">
						Product Management
					</a>
				</h4>
			</div>
			<div id="collapseTwo" class="panel-collapse collapse">
				<div class="panel-body">
					<a href="../Seller/ProductList.jsp">Product List</a>
				</div>
				<div class="panel-body">
					<a>Data List</a>
				</div>
			</div>
		</div>
		</div>
	</div>
	<div class="col-md-9 column">	

