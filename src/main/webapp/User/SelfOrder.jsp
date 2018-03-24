<%@ page import="com.Ecom.model.Order" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Shop</title>
    <%
        List<Order> orderList=(List<Order>)session.getAttribute("orderList");
    %>
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

<%
for(int i=0;i<orderList.size();i++)
{
    String status=null;
    int s=orderList.get(i).getStatus();
    if(s==0)
        status="Wait for delivery";
    else if(s==1)
        status="Wait for confirmation of receipt";
    else if(s==2)
        status="Waiting for evaluation";
    else if(s==3)
        status="Transaction completed";
%>
    <table class="table table-bordered" id="detailtable">
        <tr style="background-color:#f5f5f5;">
            <td><%=orderList.get(i).getTime()%> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;OrderID:<%=orderList.get(i).getOrder_id()%></td>
            <td>Shop Name: <a href="../Shop/ShopIndex.jsp?shop_id=<%=orderList.get(i).getShop_id()%>"><%=orderList.get(i).getShop_name()%></a></td>
            <td colspan=3 >Contact Seller</td>
        </tr>
        <tr>
            <td>
                <div style="float:left;width:50%; text-align:center;"><img  alt="no image" src="http://localhost:8080/productimage/<%=orderList.get(i).getProduct_id()%>/1"></div>
                <div style="float:left;width:50%; text-align:left;">
                    Product Name: <a href="#"><%=orderList.get(i).getProduct_name()%></a>
                    <br />
                    Property: <%=orderList.get(i).getProperty_name()%></div>
            </td>
            <td>Unit Price: <br/><%=orderList.get(i).getUnit_price()%></td>
            <td >Amount: <br/><%=orderList.get(i).getAmount()%></td>
            <td>Actual Pay: <br/><%=orderList.get(i).getActual_pay()%></td>
            <td><%=status%></td>
        </tr>
        <tr>
            <td colspan=5>
                <button type="button"  class="btn btn-info">Refund</button>
                <button type="button"  class="btn btn-info">Confirm Received</button>
                <button type="button"  class="btn btn-info" onclick="changestyle()">Comment</button>
            </td>
        </tr>
    </table>
<%
}
%>

<%--填写评论--%>
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