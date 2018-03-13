<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Address</title>
<link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
<link href="../css/bootstrapValidator.min.css" rel="stylesheet" type="text/css"/>
<link href="../css/mystyle.css" rel="stylesheet">
<link href="../css/cart.css" rel="stylesheet">
</head>

	<body>
	<div class="container">
		<jsp:include page="../Shared/_SellerManagement.jsp" />
		<ul class="breadcrumb">
			<li class="active" style="font-size:20px;">
				Address
			</li>
		</ul>

		<button type="button" class="btn btn-primary">
			<span><img src="../images/t01.png" /></span> Add
		</button>
		<table class="table table-hover">
			<thead>
				<tr>
					<th>Consignee</th>
					<th>Address</th>
					<th>Postcode</th>
					<th>Phone</th>
					<th>Operation</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>Tanmay</td>
					<td>Bangalorefdjhfgiudhgoidlhgfikhdfihsughdfjkgjfghkjdzkh,gzidgh</td>
					<td>560001</td>
					<td>374687264</td>
					<td>
						<a herf="">modify</a>&nbsp;|
						<a herf="">delete</a>
            		</td>
            		<td><input type="button" value="Use as default" ></td>
				</tr>
				<tr>
					<td>Sachin</td>
					<td>Mumbai</td>
					<td>400003</td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td>Uma</td>
					<td>Pune</td>
					<td>411027</td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
			</tbody>
		</table>
		<script src="../js/jquery-3.2.1.min.js" type="text/javascript"></script>
		<script src="../js/bootstrap.min.js" type="text/javascript"></script>
	</div>
	<body>
</html>