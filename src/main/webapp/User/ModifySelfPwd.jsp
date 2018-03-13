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
			Modify Self Password
		</li>
	</ul>
	<br>
	<center>
		<form  method="post" action="/ModifySelfPwd" class="form-horizontal" style="width:450px" >
			<div class="form-group">
			    <label for="oldPwd" class="col-sm-2 control-label" id="lb1"><span style="color:red">*&nbsp;</span>Old Password</label>
			    <div class="col-sm-9">
			      <input type="password" class="form-control" id="oldPwd" name="oldPwd" placeholder="Password">
			    </div>
		  	</div>
			<div class="form-group">
			    <label for="newPwd" class="col-sm-2 control-label" id="lb1"><span style="color:red">*&nbsp;</span>New Password</label>
			    <div class="col-sm-9">
			      <input type="password" class="form-control" id="newPwd" name="newPwd" placeholder="New Password">
			    </div>
		  	</div>
		  `	<div class="form-group" style="margin-top:-20px;">
			    <label for="cpassword" class="col-sm-2 control-label" id="lb1"><span style="color:red">*&nbsp;</span>Confirm Password</label>
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

    window.onload=function showmsg() {
        var message="${param.ModifySelfPwdMessage}";
        if(message.length == 0 || null == message)
        {
            message=null;
        }
        else
        {
            alert(message);
        }
    };
</script>
				</div>
			</div>
</body>
</html>