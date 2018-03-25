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
        Wait For Sending
    </li>
</ul>

<form action="" method="post" name="form3">
    <%
        for(int i=0;i<orderList.size();i++)
        {
            String status=null;
            int s=orderList.get(i).getStatus();
            if(s==0)//待发货
            {
                status = "Wait for delivery";

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
                <button type="button"  class="btn btn-info" id="Refund<%=i%>" onclick="ConfirmRefund(this)">Refund</button>
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


</body>

<script>
    function ConfirmRefund(obj) {
        if(confirm('Are you sure to refund?'))
        {
            Refund(obj);
            return true;
        }
        else
            return false;
    }

    function Refund(obj) {
        //获取onclick的id
        var this_id = obj.id;
        //获取i的值
        var i=obj.parentNode.parentNode;
        var order_id=document.getElementById("order_id"+i.id);
        document.form3.action='/ConfirmRefund?order_id='+order_id.innerText;
        document.form3.submit();
    }
</script>
</html>