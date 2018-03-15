<%@ page import="com.Ecom.model.User" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Shop</title>
	<link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
	<link href="../css/bootstrapValidator.min.css" rel="stylesheet" type="text/css"/>
	<link href="../css/mystyle.css" rel="stylesheet">
	<link href="../css/cart.css" rel="stylesheet">
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
		<form id="MSelfPayPwdform" name="MSelfPayPwdform"  method="post" action="/ModifySelfPayPwd" class="form-horizontal" style="width:450px">
			<div id="oldpayPassword_div" name="oldpayPassword_div" class="form-group">
				<label for="oldpayPassword" class="col-sm-2 control-label" id="lb1"><span style="color:red">*&nbsp;</span>Old Pay Password</label>
				<div class="col-sm-9">
					<input type="password" class="form-control" id="oldpayPassword" name="oldpayPassword" placeholder="Old Pay Password">
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
<script src="../js/jquery-3.2.1.min.js" type="text/javascript"></script>
<script src="../js/bootstrap.min.js" type="text/javascript"></script>
<script src="../js/bootstrapValidator.min.js" type="text/javascript"></script>
<script>
    $(function () {
        $('#MSelfPayPwdform').bootstrapValidator({
            message: 'This value is not valid',
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                oldpayPassword:{
                    validators:{
                        notEmpty:{
                            message:'old pay Password cannot be empty.'
                        }
                    }
                },
                newpassword:{
                    validators:{
                        notEmpty:{
                            message:'new password cannot be empty.'
                        }
                    }
                },
                cpassword:{
                    validators:{
                        notEmpty:{
                            message:'You should repeat the password.'
                        }
                    }
                },
            }
        }),
            $("#submit").click(function(){
                $("#MSelfPayPwdform").bootstrapValidator('validate');
            });
    });
</script>
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
        var message="${param.ModifySelfPayPwdMessage}";
        if(message.length == 0 || null == message)
        {
            message=null;
        }
        else
        {
            alert(message);
        }
    };

    $(document).ready(function(){
        //相当于request.getSession().getAttribute("user");
        var dbPayPwd="${sessionScope.user.pay_password}";
        if(dbPayPwd==0 || dbPayPwd==null)
        {
            document.getElementById("oldpayPassword_div").style.display="none";
        }
        else
            document.getElementById("oldpayPassword_div").style.display="";
    });
</script>
</body>
</html>