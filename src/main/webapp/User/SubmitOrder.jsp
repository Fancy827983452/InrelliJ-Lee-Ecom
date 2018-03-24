<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Submit Order</title>
    <link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="../css/bootstrapValidator.min.css" rel="stylesheet" type="text/css"/>
    <link href="../css/mystyle.css" rel="stylesheet">
</head>
<body>
<div class="container">
    <jsp:include page="../Shared/_Layout.jsp"/>
    <h4>Select the shipping address</h4>
    <table class="table table-hover" id="table1">
        <thead>
        <tr>
            <th></th>
            <th>Recipient</th>
            <th>Address</th>
            <th>Phone</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td><input type = "radio" name = "check" id = "check"/></td>
            <td>Tanmay</td>
            <td>Bangalore</td>
            <td>560001</td>
        </tr>
        <tr>
            <td><input type = "radio" name = "check" id = "check"/></td>
            <td>Sachin</td>
            <td>Mumbai</td>
            <td>400003</td>
        </tr>
        <tr>
            <td><input type = "radio" name = "check" id = "check"/></td>
            <td>Uma</td>
            <td>Pune</td>
            <td>411027</td>
        </tr>
        </tbody>
    </table>

    <div class="modal fade" id="addaddress" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="myModalLabel">Add Address</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" method="post" action="/AddSelfAddress" id="Addressform" name="Addressform">
                        <div class="form-group row">
                            <label for="receiver_name" class="col-md-offset-2 col-md-2 control-label" ><span style="color:red">*&nbsp;</span>Receiver Name:</label>
                            <div class="col-md-6"><input type="text" class="form-control" id="receiver_name" name="receiver_name"></div>
                        </div>
                        <div class="form-group row">
                            <label for="address" class="col-md-offset-2 col-md-2 control-label" ><span style="color:red">*&nbsp;</span>Address:</label>
                            <div class="col-md-6"><input type="text" class="form-control" id="address" name="address"></div>
                        </div>
                        <div class="form-group row">
                            <label for="phone" class="col-md-offset-2 col-md-2 control-label" ><span style="color:red">*&nbsp;</span>Phone:</label>
                            <div class="col-md-6"><input type="text" class="form-control" id="phone" name="phone"></div>
                        </div>
                        <div class="form-group row">
                            <label for="zip_code" class="col-md-offset-2 col-md-2 control-label" ><span style="color:red">*&nbsp;</span>Zip Code:</label>
                            <div class="col-md-6"><input type="text" class="form-control" id="zip_code" name="zip_code"></div>
                        </div>
                        <div class="modal-footer">
                            <!--<button type="button" class="btn btn-default" style="border: none">Forget Password</button>-->
                            <center><button type="submit" class="btn btn-primary">Add</button></center>
                        </div>
                    </form>
                </div>

            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->

    <button type="submit" class="btn btn-default" data-toggle="modal" data-target="#addaddress">Add New Address</button>
    <button type="submit" class="btn btn-default">Modify Address</button>

    <table class="table table-bordered" id="detailtable" style="margin-top:40px;">
        <tr style="background-color:#f5f5f5;">
            <td>2018-3-13 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;OrderID:12456789</td>
            <td><a href="../Shop/ShopIndex.jsp">ShopName</a></td>
            <td colspan=3 >
                Contact Seller
            </td>
        </tr>
        <tr>
            <td>
                <div style="float:left;width:50%; text-align:center;"><img alt="no image" src="../images/pc.jpg"></div>
                <div style="float:left;width:50%; text-align:left;"><a href="#">ProductName</a><br> property</div>
            </td>
            <td>
                price
            </td>
            <td >
                Amount
            </td>
            <td>
                Total Price
            </td>
            <td>
                Shipping fee
            </td>
        </tr>
    </table>
    <button type="submit" class="btn btn-default" style="float: right;color: red;">Pay</button>
</div>
</body>
</html>
