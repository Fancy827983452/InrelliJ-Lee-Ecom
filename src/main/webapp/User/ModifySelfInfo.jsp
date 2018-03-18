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
<%--<%--%>
	<%--User user=(User)request.getSession().getAttribute("user");--%>
<%--%>--%>
</head>
<body>
<jsp:include page="../Shared/_PersonalCenter.jsp" />
	<div>
	<ul class="breadcrumb">
				<li class="active">
					 User Management
				</li>
				<li class="active">
					Modify Self Information
				</li>
			</ul>
	<br>
	<center>
		<form class="form-horizontal" id="MSelfInfoform" name="MSelfInfoform" style="width:450px" method="post" onsubmit="return check()" action="/ModifySelfInfo">
	  		<div class="form-group" >
			    <label for="email" class="col-sm-2 control-label">EmailID</label>
			    <div class="col-sm-9">
			      <input type="text" class="form-control" name="email" readonly="readonly" id="email" placeholder="EmailID" value="${user.email}"></input>
			    </div>
			  </div>
	  		
	  		<div class="form-group" >
	    		<label for="name" class="col-sm-2 control-label"><span style="color:red">*&nbsp;</span>Name</label>
	    		<div class="col-sm-9">
	      			<input type="text" class="form-control" id="name" name="name" value="${user.name}" placeholder="Name"></input>
	    		</div>
	  		</div>
	  		
	  		<div class="form-group" >
	    		<label for="actual_name" class="col-sm-2 control-label" id="lb1"><span style="color:red">*&nbsp;</span>Actual Name</label>
	    		<div class="col-sm-9">
	      			<input type="text" readonly="readonly" class="form-control" id="actual_name" name="actual_name" value="${user.actual_name}" placeholder="ActualName"></input>
	    		</div>
	  		</div>
			<div class="form-group">
				<label class="col-sm-2 control-label"><span style="color: red">*&nbsp;</span>Gender</label>
				<div class="radio-list">
					<label>
						<input name="gender" id="rd1" value="0" ng-model="vm.bean.sex" class="ng-pristine ng-valid" type="radio"> Male
					</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<label>
						<input name="gender" id="rd2" value="1" ng-model="vm.bean.sex" class="ng-pristine ng-valid" type="radio"> Female
					</label>
				</div>
			</div>
	  		<div class="form-group" >
	    		<label for="phone" class="col-sm-2 control-label"><span style="color:red">*&nbsp;</span>Phone</label>
	    		<div class="col-sm-9">      
	      			<input type="text" class="form-control" id="phone" name="phone" value="${user.phone}" placeholder="Phone" onchange="checkPhone()"/>
	    		</div>
	    		<div class="col-sm-1">
					<span id="pw" style="color:red;display: none;float:left;margin-left:-25px;margin-top:7px;"><span class='glyphicon glyphicon-remove'></span></span>
					<span id="pr" style="color:green;display: none;float:left;margin-left:-25px;margin-top:7px;"><span class='glyphicon glyphicon-ok'></span></span>
				</div>
	  		</div>
	  		
	  		<div class="form-group">
			    <div class="col-sm-offset-2 col-sm-10">
			       <button type="submit" class="btn btn-default">Submit</button>
			        &nbsp; &nbsp; &nbsp; &nbsp; 
			       <button type="reset" class="btn btn-default">Cancel</button>
			    </div>
			</div>
	  	</form>
	  	</center>
	</div>
<script src="../js/jquery-3.2.1.min.js" type="text/javascript"></script>
<script src="../js/bootstrap.min.js" type="text/javascript"></script>
<script src="../js/bootstrapValidator.min.js" type="text/javascript"></script>
<script>
    $(function () {
            $('#MSelfInfoform').bootstrapValidator({
                message: 'This value is not valid',
                feedbackIcons: {
                    valid: 'glyphicon glyphicon-ok',
                    invalid: 'glyphicon glyphicon-remove',
                    validating: 'glyphicon glyphicon-refresh'
                },
                fields: {
                    name: {
                        validators: {
                            notEmpty: {
                                message: 'Username can not be empty.'
                            },
                            stringLength: {
                                /*长度提示*/
                                min: 1,
                                max: 10,
                                message: 'Username must be between 1 and 10 characters in length.'
                            }
                        }
                    },
                    Gender:{
                        validators:{
                            notEmpty:{
                                message:'Gender cannot be empty.'
                            }
                        }
                    },
                    phone:{
                        validators:{
                            notEmpty:{
                                message:'Phone number cannot be valid.'
                            },
                            stringLength:{
                                min:11,
                                max:11,
                                message:'The length of the phone number should be 11 digits.'
                            },
                            regexp: {
                                regexp: /^1[3|5|8]{1}[0-9]{9}$/,
                                message: 'Please enter the right phone number.'
                            }
                        }

                    },

				}
            }),
        $("#submit").click(function(){
            $("#MSelfInfoform").bootstrapValidator('validate');
        });
        });
</script>
<script>
    // function check() {
    //     if($("#name").val()) {
    //         alert('User Name cannot be null!');
    //         //alert("$(\"#name\").val()="+$("#name").val());
    //         return false;}
    //     if($("#phone").val().length==0) {
    //         alert('Phone cannot be null!');
    //         return false;}
    //
    //      // if(document.getElementById("name").value=="") {
    //      //     alert('User Name cannot be null!');
    //      //     return false;
    //      // }
    //      // if(document.getElementById("phone").value=="") {
    //      //     alert('Password cannot be null!');
    //      //     return false;
    //      // }
    //
    //     var phone=$("#phone").val();
    // 	var re = /^1\d{10}$/;
    // 	if(phone.length==0) {return true;}
    // 	else {
    //         if (!re.test(phone)) {
    //             alert("Please enter correct phone number!");
    //             return false;
    //         }
    //     }
    // }
    
    // function checkPhone() {
    // 	var phone=document.getElementById("phone").value;
    // 	var re = /^1\d{10}$/;
    // 	if (!re.test(phone)) {
    // 		document.getElementById("pw").style.display="";
    // 		document.getElementById("pr").style.display="none";
    // 		return false;
    // 	}
    // 	else {
	 //   		document.getElementById("pr").style.display="";
	 //   		document.getElementById("pw").style.display="none";
	 //   		return false;
   	// 	}
    // }
    $(document).ready(//操作单选框选中状态
    function setRadio() {
        var gender ="${user.gender}";
        var rd1 = document.getElementById("rd1");
        var rd2 = document.getElementById("rd2");
        if (gender == "0")
            rd1.checked = true;
        else
            rd2.checked = true;
    });
    window.onload=function showmsg() {
        var message="${param.ModifySelfInfoMessage}";
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

</body>
</html>