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
<ul class="breadcrumb">
    <li class="active">
        View My Order
    </li>
    <li class="active">
       All Order
    </li>
</ul>

<table class="table table-bordered" id="detailtable">
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
            Total Price&shipping fee
        </td>
        <td>
            Status
        </td>
    </tr>
    <tr>
        <td colspan=5>
            <button type="button"  class="btn btn-info">Refund</button>
            <button type="button"  class="btn btn-info">Confirm Received</button>
            <button type="button"  class="btn btn-info" onclick="changestyle()">Comment</button>
        </td>
    </tr>
</table>

<table class="table table-bordered" id="detailtable">
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
            Total Price&shipping fee
        </td>
        <td>
            Status
        </td>
    </tr>
    <tr>
        <td colspan=5>
            <button type="button"  class="btn btn-info">Refund</button>
            <button type="button"  class="btn btn-info">Confirm Received</button>
            <button type="button"  class="btn btn-info" onclick="changestyle()">Comment</button>
        </td>
    </tr>
</table>
<form role="form" id="Commentdiv" style="display: none">
    <div class="form-group col-md-7">
        <label for="name">Comments</label>
        <textarea class="form-control" rows="5"></textarea>
    </div>
    <div class="form-group">
        <label for="inputfile">Add Images</label>
        <input type="file" id="inputfile">
    </div>
    <div class="form-group" style="margin-top: 40px;">
        <button type="submit" class="btn btn-default">Submit</button>
    </div>

</form>
</body>
<script type="text/javascript">
    function changestyle(){
        var mychar = document.getElementById("Commentdiv");
        mychar.style.display="block";
    }
</script>
</html>