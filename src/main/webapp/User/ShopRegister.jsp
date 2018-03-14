<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Shop Register</title>
        <link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="../css/bootstrapValidator.min.css" rel="stylesheet" type="text/css"/>
        <link href="../css/mystyle.css" rel="stylesheet">
        <link href="../css/cart.css" rel="stylesheet">
    </head>
</head>
<body>
    <div class="container">
        <jsp:include page="../Shared/_SellerManagement.jsp" />
        <ul class="breadcrumb">
            <li class="active">
                User Management
            </li>
            <li class="active">
                Register Shop
            </li>
        </ul>
        <center>
            <form class="form-horizontal" style="width:550px" method="post" onsubmit="" action="">

                <div class="form-group" >
                    <label for="email" class="col-sm-2 control-label">EmailID</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control" name="email" readonly="readonly" id="email" placeholder="EmailID" value="${user.email}"></input>
                    </div>
                </div>

                <div class="form-group" >
                    <label for="shop_name" class="col-sm-2 control-label"><span style="color:red">*&nbsp;</span>Shop Name</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control" name="shop_name" id="shop_name" placeholder="Shop Name"></input>
                    </div>
                </div>

                <div class="form-group row">
                    <label for="type" class="col-sm-2 control-label"><span style="color:red">*&nbsp;</span>Type:</label>
                    <div class="col-md-9">
                        <input  type="radio" name="type" id="rd1" value="0" onchange="setDiv()" checked>Personal
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <input  type="radio" name="type" id="rd2" value="1" onchange="setDiv()">Company
                    </div>
                </div>

                <div class="form-group row" id="business_license_div">
                    <label for="business_license" class="col-sm-2 control-label"><span style="color:red">*&nbsp;</span>Business License</label>
                    <div class="col-sm-9">
                        <input type='file' class="form-control" id="business_license" name="business_license" required/>
                    </div>
                </div>

                <div class="form-group" >
                    <label for="description" class="col-sm-2 control-label"><span style="color:red">*&nbsp;</span>Description</label>
                    <div class="col-sm-9">
                        <textarea name="description" class="form-control" id="description" cols="30" rows="5" placeholder="Description"></textarea>
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

<SCRIPT>
    $(document).ready(function () {
        document.getElementById("business_license_div").style.display="none";//隐藏
    });

    function setDiv() {
        var rd1 = document.getElementById("rd1");
        var rd2 = document.getElementById("rd2");
        if(rd1.checked==false)//如果选中的是Company
        {
            document.getElementById("business_license_div").style.display="";//显示
        }
        else
            document.getElementById("business_license_div").style.display="none";//隐藏
    }
</SCRIPT>
</body>
</html>
