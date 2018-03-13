<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Shop</title>
</head>
<body>
<jsp:include page="../Shared/_SellerManagement.jsp" />
	<ul class="breadcrumb">
		<li class="active">
			 User Management
		</li>
		<li class="active">
			Modify Self Pay Password
		</li>
	</ul>
	<br>
	<center>
		<form  method="post" action="/" class="form-horizontal" style="width:450px">
			<div class="form-group">
			    <label for="payPassword" class="col-sm-2 control-label" id="lb1"><span style="color:red">*&nbsp;</span>Old Pay Password</label>
			    <div class="col-sm-9">
			      <input type="password" class="form-control" id="payPassword" name="payPassword" placeholder="Pay Password">
			    </div>
		  	</div>
			<div class="form-group">
			    <label for="newpassword" class="col-sm-2 control-label" id="lb1"><span style="color:red">*&nbsp;</span>New Pay Password</label>
			    <div class="col-sm-9">
			      <input type="password" class="form-control" id="newpassword" name="newpassword" placeholder="New Password">
			    </div>
		  	</div>
		  `	<div class="form-group" style="margin-top:-20px;">
			    <label for="cpassword" class="col-sm-2 control-label" id="lb1"><span style="color:red">*&nbsp;</span>Confirm Pay Password</label>
			    <div class="col-sm-9">
		     		<input type="password" class="form-control" id="cpassword" name="cpassword"  placeholder="Confirm Password">
			    </div>
		  	</div>
		  	<div class="form-group">
			    <div class="col-sm-offset-2 col-sm-10">
			      <button type="submit" class="btn btn-default">Submit</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			      <button type="submit" class="btn btn-default">Cancel</button>
			    </div>
		    </div> 
	    </form>
   	</center>
			    
   	<script>
    function check()
    {   
    	 if(document.getElementById("password").value=="")
         {
             alert('Old Password cannot be null!');
             return false;
         }
    	 if(document.getElementById("newpassword").value=="")
         {
             alert('New Password cannot be null!');
             return false;
         }
         if(document.getElementById("cpassword").value=="")
         {
             alert('Confirm Password cannot be null!');
             return false;
         }
    	var npwd = document.getElementById("newpassword").value;
        var cpwd = document.getElementById("cpassword").value;
        if(npwd!==cpwd)
        {
        	 alert('New Password and Confirm password are not same!');
             return false;
        }
    }
</script>
</body>
</html>