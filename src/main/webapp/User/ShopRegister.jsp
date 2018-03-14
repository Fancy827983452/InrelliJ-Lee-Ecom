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
                    <label for="actual_name" class="col-sm-2 control-label" id="lb1"><span style="color:red">*&nbsp;</span>Actual Name</label>
                    <div class="col-sm-9">
                        <input type="text" readonly="readonly" class="form-control" id="actual_name" name="actual_name" value="${user.actual_name}" placeholder="ActualName"></input>
                    </div>
                </div>

                <div class="form-group" >
                    <label for="shop_name" class="col-sm-2 control-label"><span style="color:red">*&nbsp;</span>Shop Name</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control" name="shopname" id="shop_name" placeholder="Shop Name"></input>
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
</body>
</html>
