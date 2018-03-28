<%@ page import="com.Ecom.model.Address" %>
<%@ page import="java.util.List" %>
<%@ page import="com.Ecom.model.ShoppingCart" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="com.Ecom.dao.Utils" %>
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
        //用map存储店铺名
        Map<Object,Object> map=new HashMap<Object,Object>();
        for(int i=0;i<num;i++) {
            shoppingCartItem[i] = (ShoppingCart) session.getAttribute("shoppingCartItem" + i);
            map.put(i,shoppingCartItem[i].getShop_name());
        }
        float total=0;
        Utils utils=new Utils();
        //获取店铺名重复了几次
        int[] repeat=utils.getRepeatNum(map);

        //保留不重复的店铺名
        map=utils.RemoveRepFromMap(map);
        Object[] keys=utils.getKeys(map);
    %>
</head>
<body>
<div class="container">
    <jsp:include page="../Shared/_Layout.jsp"/>
    <h4>Select the shipping address:</h4>
    <%--地址表格--%>
    <form name="form4" method="post" action="">
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
                    for(int i1=0;i1<addressList.size();i1++){//行数
            %>
            <tr>
                <td class="tb2_td1">
                    <input type = "radio" name = "check" id = "check" value="<%=addressList.get(i1).getAddress_id()%>"/>
                </td>
                <td><%=addressList.get(i1).getReceiver_name()%></td>
                <td><%=addressList.get(i1).getAddress()%></td>
                <td><%=addressList.get(i1).getZip_code()%></td>
                <td><%=addressList.get(i1).getPhone()%></td>
                <td>
                    <%
                        if(addressList.get(i1).getDefault_address()!=0){
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
            <%
                for(int j=0;j<map.size();j++)//判断店铺个数
                {
                    int index=Integer.parseInt(keys[j].toString());
            %>
            <table class="table table-bordered">
                <tr style="background-color:#f5f5f5;">
                    <td colspan="4" style="text-align: center">Shop Name: <a href="#" name="shop_name"><%=map.get(index)%></a></td>
                </tr>
                <%
                    for(int i2=0;i2<num;i2++)//提交的购物车中商品条数
                    {
                        //判断哪些商品是同一个店铺的
                        if(shoppingCartItem[i2].getShop_name().equals(map.get(index).toString()))
                        {
                            float[] unit_price=new float[num];
                            int amount[]=new int[num];
                            float actual_pay[]=new float[num];
                            unit_price[i2]=shoppingCartItem[i2].getUnit_price();
                            amount[i2]=shoppingCartItem[i2].getAmount();
                            actual_pay[i2]=unit_price[i2] * amount[i2];
                            total+=actual_pay[i2];
                %>
                <tr>
                    <td>
                        <div style="float:left;width:50%; text-align:center;">
                            <img  alt="no image" src="http://localhost:8080/productimage/<%=shoppingCartItem[i2].getProduct_id()%>/1">
                        </div>
                        <div style="float:left;width:50%; text-align:left;">
                            Product Name:
                            <a name="product_name<%=i2%>" href="http://localhost:8080/productinfo/<%=shoppingCartItem[i2].getProduct_id()%>">
                                <%=shoppingCartItem[i2].getProduct_name()%>
                            </a>
                            <br />
                            Property:
                            <a name="property_name<%=i2%>" style="text-decoration:none;color:#000000;">
                                <%=shoppingCartItem[i2].getProperty_name()%></a>
                        </div>
                    </td>
                    <td>Unit Price: <br/>￥<a name="unit_price<%=i2%>" style="text-decoration:none;color:#000000;"><%=unit_price[i2]%></a></td>
                    <td >Amount: <br/><a name="amount<%=i2%>" style="text-decoration:none;color:#000000;"><%=amount[i2]%></a></td>
                    <td>Actual Pay: <br/>￥<a name="actual_pay<%=i2%>" style="text-decoration:none;color:#000000;"><%=actual_pay[i2]%></a></td>
                </tr>
                <%
                            }
                        }
                    }
                %>
            </table>

            <label style="float:right;color: red;font-size: 20px">Total: ￥<%=total%></label>
            <input type="hidden" id="totalPrice" name="totalPrice" value="<%=total%>"/>
            <input type="hidden" id="num" name="num" value="<%=num%>"/>
        <br/><br/>
        <button type="submit" class="btn btn-default btn-primary" style="float: right;" onclick="selectAddress()">Submit Order</button>
        <br/><br/><br/><br/>

    </form>
</div>
</body>

<script>
    function selectAddress() {
        var obj = document.getElementsByName("check");
        check_val = [];
        for (k in obj) {
            if (obj[k].checked)
                check_val.push(obj[k].value);
        }
        if (check_val.length == 0)
            alert("Please select an address!");
        else {
            document.form4.action = '/SubmitOrder?address_id=' + check_val;
            document.form4.submit();
        }
    }

    //点击行时选中单选框
    $("tr").bind("click",function(){
        $("input:radio").attr("checked",false);
        $(this).find("td").find("input:radio").attr("checked",true);
    });
</script>

</html>
