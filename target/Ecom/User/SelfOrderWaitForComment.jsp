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
        Wait For Comment
    </li>
</ul>
<form action="" method="post" name="form3">
    <%
        for(int i=0;i<orderList.size();i++)
        {
            String status=null;
            int s=orderList.get(i).getStatus();
            if(s==2)//待评价
            {    status="Waiting for evaluation";

    %>
    <input type="hidden" id="size" value="<%=orderList.size()%>"/>
    <input type="hidden" id="s<%=i%>" value="<%=orderList.get(i).getStatus()%>"/>
    <table class="table table-bordered">
        <tr style="background-color:#f5f5f5;">
            <td><%=orderList.get(i).getTime()%> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                OrderID:<span id="order_id<%=i%>"><%=orderList.get(i).getOrder_id()%></span>
            </td>
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
            <td id="status<%=i%>"><%=status%></td>
        </tr>
        <tr id="<%=i%>">
            <td colspan=5>
                <button type="button"  class="btn btn-info" onclick="changestyle()" id="Comment<%=i%>">Comment</button>
            </td>
        </tr>
    </table>
    <%
            }
            else
                continue;
        }
    %>
</form>

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