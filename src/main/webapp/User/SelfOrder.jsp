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
    <script type="text/javascript">
        var message="${param.Message}";
        if(message.length == 0 || null == message)
        {
            message=null;
        }
        else
        {
            alert(message);
            window.location.href="SelfOrder.jsp";
        }
    </script>
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

<form action="" method="post" name="form3">
<%
for(int i=0;i<orderList.size();i++)
{
    String status=null;
    int s=orderList.get(i).getStatus();
    if(s==0)//待发货
        status="Wait for delivery";
    else if(s==1)//待收货
        status="Wait for confirmation of receipt";
    else if(s==2)//待评价
        status="Waiting for evaluation";
    else if(s==3)//交易完成
        status="Transaction completed";
    else if(s==4)//退款成功
        status="Refunded Successfully";
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
                <button type="button"  class="btn btn-info" onclick="ConfirmReceived(this)" id="ConfirmReceived<%=i%>">Confirm Received</button>
                <button type="button"  class="btn btn-info" onclick="changestyle()" id="Comment<%=i%>">Comment</button>
            </td>
        </tr>
    </table>
<%
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

    function ConfirmReceived(obj) {
        if(confirm('Are you sure you have received the product?'))
        {
            Received(obj);
            return true;
        }
        else
            return false;
    }
    
    function Received(obj) {
        //获取onclick的id
        var this_id = obj.id;
        //获取i的值
        var i=obj.parentNode.parentNode;
        var order_id=document.getElementById("order_id"+i.id);
        document.form3.action='/ConfirmReceived?order_id='+order_id.innerText;
        document.form3.submit();
    }

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

    //根据订单状态控制button的显示与隐藏
    $(document).ready(function showBtn() {
        var size=document.getElementById("size");
        for(var i=0;i<size.value;i++)
        {
            var status=document.getElementById("s"+i);
            var ConfirmReceived=document.getElementById("ConfirmReceived"+i);
            var Refund=document.getElementById("Refund"+i);
            var Comment=document.getElementById("Comment"+i);
            if(status.value==0)//待发货
            {
                ConfirmReceived.style.display="none";
                Refund.style.display="";
                Comment.style.display="none";
            }
            else if(status.value==1)//待收货
            {
                ConfirmReceived.style.display="";//显示
                Refund.style.display="none";//隐藏
                Comment.style.display="none";//隐藏
            }
            else if(status.value==2)//待评价
            {
                ConfirmReceived.style.display="none";
                Refund.style.display="none";
                Comment.style.display="";
            }
            else//退款成功或交易完成
            {
                ConfirmReceived.style.display="none";
                Refund.style.display="none";
                Comment.style.display="none";
            }
        }
    });
</script>
</html>