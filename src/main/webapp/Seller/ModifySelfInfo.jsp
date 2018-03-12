<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Shop</title>
</head>
<body>
<jsp:include page="../Shared/_SellerManagement.jsp" />
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
		<form class="form-horizontal" style="width:450px" method="post" onsubmit="return check()">
	  		<div class="form-group" >
			    <label for="UserID" class="col-sm-2 control-label">EmailID</label>
			    <div class="col-sm-9">
			      <input type="text" class="form-control" name="EmailID" readonly="readonly" id="EmailID" placeholder="EmailID" value=""></input>
			    </div>
			  </div>
	  		
	  		<div class="form-group" >
	    		<label for="Name" class="col-sm-2 control-label"><span style="color:red">*&nbsp;</span>Name</label>
	    		<div class="col-sm-9">
	      			<input type="text" class="form-control" id="Name" name="Name" value="" placeholder="Name"></input>
	    		</div>
	  		</div>
	  		
	  		<div class="form-group" >
	    		<label for="Name" class="col-sm-2 control-label" id="lb1"><span style="color:red">*&nbsp;</span>Actual Name</label>
	    		<div class="col-sm-9">
	      			<input type="text" readonly="readonly" class="form-control" id="ActualName" name="ActualName" value="" placeholder="ActualName"></input>
	    		</div>
	  		</div>
			<div class="form-group">
				<label class="col-sm-2 control-label" id="lb1"><span
					style="color: red">*&nbsp;</span>Gender</label>
				<div class="radio-list">
					<label><input name="Gender" id="Gender" value="male"
						checked="checked" ng-model="vm.bean.sex"
						class="ng-pristine ng-valid" type="radio"> male</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label><input
						name="Gender" id="Gender" value="female" ng-model="vm.bean.sex"
						class="ng-pristine ng-valid" type="radio"> female</label>
				</div>
			</div>
	  		<div class="form-group" >
	    		<label for="Phone" class="col-sm-2 control-label"><span style="color:red">*&nbsp;</span>Phone</label>
	    		<div class="col-sm-9">      
	      			<input type="text" class="form-control" id="Phone" name="Phone" value="" placeholder="Phone" onchange="checkPhone()"></input>
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
<script>
    function check()
    {
    	 if(document.getElementById("Name").value=="")
         {    
             alert('User Name cannot be null!');
             return false;
         }    
    	 if(document.getElementById("Phone").value=="")
         {
             alert('Password cannot be null!');
             return false;
         }
        
        var phone=document.getElementById("Phone").value;
    	var re = /^1\d{10}$/;
    	if(phone=="")
   		{
   			return true;
   		}
    	else
   		{
	    	if (!re.test(phone)) 
	    	{
	    	alert("Please enter correct phone number!");
	    	return false;
	    	}
   		}
    	
    }
    
    function checkPhone()
    {
    	var phone=document.getElementById("phonenumber").value;
    	var re = /^1\d{10}$/;
    	if (!re.test(phone)) 
    	{
    		document.getElementById("pw").style.display="";
    		document.getElementById("pr").style.display="none";
    		return false;
    	}
    	else
   		{
	   		document.getElementById("pr").style.display="";
	   		document.getElementById("pw").style.display="none";
	   		return false;
   		}
    		
    	
    }
    
</script>

</body>
</html>