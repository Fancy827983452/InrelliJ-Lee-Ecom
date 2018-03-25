<%@ page import="com.Ecom.model.Address" %>
<%@ page import="java.util.List" %>
<%@ page import="com.Ecom.model.ShoppingCart" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Submit Order</title>
    <link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="../css/bootstrapValidator.min.css" rel="stylesheet" type="text/css"/>
    <link href="../css/mystyle.css" rel="stylesheet">
    <%
        int num=Integer.parseInt(request.getParameter("num"));
        List<Address> addressList=(List<Address>)session.getAttribute("addressList");
        ShoppingCart[] shoppingCartItem=new ShoppingCart[num];
    %>
</head>
<body>
<div class="container">
    <jsp:include page="../Shared/_Layout.jsp"/>
    <h4>Select the shipping address:</h4>
    <%--地址表格--%>
    <form name="form1" method="post" action="">
        <table class="table table-hover" id="addresstable">
            <thead>
            <tr>
                <th></th>
                <th>Receiver Name</th>
                <th>Address</th>
                <th>Zip Code</th>
                <th>Phone</th>
                <th>Default</th>
            </tr>
            </thead>
            <tbody>

            <%
                if(!addressList.isEmpty()){
                    for(int i=0;i<addressList.size();i++){//行数
            %>
            <tr>
                <td class="tb2_td1">
                    <input type = "radio" name = "check" id = "check" value="<%=addressList.get(i).getAddress_id()%>"/>
                </td>
                <td><%=addressList.get(i).getReceiver_name()%></td>
                <td><%=addressList.get(i).getAddress()%></td>
                <td><%=addressList.get(i).getZip_code()%></td>
                <td><%=addressList.get(i).getPhone()%></td>
                <td>
                    <%
                        if(addressList.get(i).getDefault_address()!=0){
                    %>
                    <label class="btn-primary">Default</label>
                    <%}%>
                </td>
            <tr>
                    <%
                }
            }
        %>
            </tbody>
        </table>

    <a href="ManageSelfAddress.jsp">->Go to manage the address</a>
    <br/><br/>

        <%--订单--%>
        <form action="" method="post" name="form3">
            <%
                for(int i=0;i<num;i++)
                {
                    shoppingCartItem[i]=(ShoppingCart)session.getAttribute("shoppingCartItem"+i);
                    float unit_price=shoppingCartItem[i].getUnit_price();
                    int amount=shoppingCartItem[i].getAmount();
                    float actual_pay=unit_price*amount;
            %>
            <table class="table table-bordered">
                <tr style="background-color:#f5f5f5;">
                    <td colspan="4" style="text-align: center">Shop Name: <a href="#"><%=shoppingCartItem[i].getShop_name()%></a></td>
                </tr>
                <tr>
                    <td>
                        <div style="float:left;width:50%; text-align:center;"><img  alt="no image" src="http://localhost:8080/productimage/<%=shoppingCartItem[i].getProduct_id()%>/1"></div>
                        <div style="float:left;width:50%; text-align:left;">
                            Product Name: <a href="http://localhost:8080/productinfo/<%=shoppingCartItem[i].getProduct_id()%>"><%=shoppingCartItem[i].getProduct_name()%></a>
                            <br />
                            Property: <%=shoppingCartItem[i].getProperty_name()%></div>
                    </td>
                    <td>Unit Price: <br/><%=unit_price%></td>
                    <td >Amount: <br/><%=amount%></td>
                    <td>Actual Pay: <br/><%=actual_pay%></td>
                </tr>
            </table>
            <%
                }
            %>
        </form>
    <button type="submit" class="btn btn-default btn-primary" style="float: right;">Submit Order</button>
        <br/><br/><br/><br/>
</div>
</body>


</html>
