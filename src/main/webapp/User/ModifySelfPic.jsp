<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Shop</title>
</head>
<body>
<jsp:include page="../Shared/_PersonalCenter.jsp" />
<div>
	<ul class="breadcrumb">
				<li class="active">
					 User Management
				</li>
				<li class="active">
					Modify Self Picture
				</li>
			</ul>
	<br>
	<center>
		<form class="form-horizontal" method="post" action="">
				<div class="row clearfix">
					<div class="col-md-6 column">
						<div class="row clearfix">					
							<div class="col-sm-offset-3 col-sm-9">
								<h4>Current Image:</h4>
								<input type="text" class="form-control" name="currentUrl" id="currentUrl" value="" placeholder="Opps, you haven't set a profile photo" readonly="readonly"/>
							</div>
						</div>
						<br>
						<div class="row clearfix">
							<div class="col-sm-offset-3 col-sm-9">
								<h4>Choose one picture from disk:</h4>
								<input type='file' class="form-control" id="iptfileupload" name="iptfileupload" onchange='show()' value='' required/>
							</div>
						</div>
					</div>
					
					<div class="col-md-6 column">
						<div class="row clearfix">
							<div class="col-md-12 column">
								<h4>Preview:</h4>
								<img src="" id='img' width="200px" height="200px"/>
							</div>
						</div>
					</div>
					<br><br><br><br>
					<div class="row clearfix">
						<div class="col-md-12 column">
							<button type="submit" class="btn btn-default">Submit</button>
						</div>
					</div>
				</div>
		</form>
	</center>
</div>
</body>
</html>