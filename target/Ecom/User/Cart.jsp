<%@ page import="java.util.List" %>
<%@ page import="com.Ecom.model.ShoppingCart" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>Cart</title>

	<link href="../css/mystyle.css" rel="stylesheet" type="text/css" />

	<script type="text/javascript" src="../js/jquery.1.4.2-min.js"></script>
	<script type="text/javascript" src="../js/Calculation.js"></script>
	<%
		List<ShoppingCart> shoppingCartList=(List<ShoppingCart>)session.getAttribute("shoppingCartList");
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
        }
	</script>
</head>

<body>
<form action="" method="post" name="form1">
<div class="container">
	<jsp:include page="../Shared/_Layout.jsp"/>
	<div class="gwc" style=" margin:auto;">
		<table cellpadding="0" cellspacing="0" class="gwc_tb1">
			<tr>
				<th class="tb2_td1"><input id="c1" type="checkbox"  class="allselect"/></th>
				<th class="tb2_td2">Picture</th>
				<th class="tb2_td3">Product Name</th>
				<th class="tb1_td4">Property</th>
				<th class="tb1_td5">Unit Price</th>
				<th class="tb1_td6">Amount</th>
				<th class="tb1_td7">Price</th>
				<th class="tb1_td8">Delete</th>
			</tr>
		</table>

		<input type="hidden" id="size" name="size" value="<%=shoppingCartList.size()%>"/>
		<%
			for(int i=0;i<shoppingCartList.size();i++)
			{
		%>
			<table cellpadding="0" cellspacing="0" class="CartTb">
                <tr class="table-bordered">
                    <td colspan="8" style="padding-left: 70px">Shop Name:
                        <a href="../Shop/ShopIndex.jsp?shop_id=<%=shoppingCartList.get(i).getShop_id()%>"><%=shoppingCartList.get(i).getShop_name()%></a>
                    </td>
                </tr>
				<tr id="<%=i%>">
					<td class="tb2_td1"><input type="checkbox" name="c" id="newslist-<%=i%>" value="<%=shoppingCartList.get(i).getCart_id()%>"/></td>
					<td class="tb2_td2"><a href="#"><img  alt="no image" src="http://localhost:8080/productimage/<%=shoppingCartList.get(i).getProduct_id()%>/1"></a></td>
					<td class="tb2_td3"><a href="http://localhost:8080/productinfo/<%=shoppingCartList.get(i).getProduct_id()%>"><%=shoppingCartList.get(i).getProduct_name()%></a></td>
					<td class="tb1_td4"><%=shoppingCartList.get(i).getProperty_name()%></td>
					<td class="tb1_td5">
						<span style="color:#ff5500;font-size:14px; font-weight:bold;">￥</span>
						<label id="unit_price<%=i%>" style="color:#ff5500;font-size:14px; font-weight:bold;" >
							<%=shoppingCartList.get(i).getUnit_price()%>
						</label>
					</td>
					<td class="tb1_td6" id="td">
						<input id="min<%=i%>" name=""  style=" width:20px; height:24px;border:1px solid #ccc;" type="button" value="-" onclick="minus(this)"/>
						<input id="text_box<%=i%>" name="" type="text" value="<%=shoppingCartList.get(i).getAmount()%>" style=" width:30px; text-align:center; border:1px solid #ccc;" />
						<input id="add<%=i%>" name="" style=" width:20px; height:24px;border:1px solid #ccc;" type="button" value="+" onclick="add(this)"/>
					</td>
					<td class="tb1_td7">
						<span style="color:#ff5500;font-size:14px; font-weight:bold;">￥</span>
						<label class="tot" id="total<%=i%>" style="color:#ff5500;font-size:14px; font-weight:bold;" ></label>
					</td>
					<td class="tb1_td8"><a id="delete" onclick="confirmDelete(this)">Delete</a></td>
				</tr>
			</table>
		<%
			}
		%>


		<%--付款按钮--%>
		<table cellpadding="0" cellspacing="0" class="gwc_tb3">
			<tr>
				<td class="tb1_td1">&nbsp;</td>
				<td class="tb1_td1">&nbsp;</td>
				<td class="tb3_td1">&nbsp;</td>
				<td class="tb3_td2">Seleted: <label id="Amount" style="color:#ff5500;font-size:14px; font-weight:bold;">0</label> </td>
				<td class="tb3_td3">Total:<span style=" color:#ff5500;">￥<label id="Total" style="color:#ff5500;font-size:14px; font-weight:bold;">0.00</label></span></td>
				<td class="tb3_td4">
                    <span id="jz1">Pay</span>
                    <a style=" display:none;"  class="jz2" id="jz2" onclick="pay()">Pay</a>
                </td></tr>
		</table>
	</div>
</div>
</form>
</body>
<script type="text/javascript">
    $("#c1").click(function(){
        var a = document.getElementById("c1");
        var b = document.getElementsByName("c");
        if(a.checked){
            for(var i = 0; i < b.length; i++){
                b[i].checked = true;
            }
        }else{
            for(var i = 0; i < b.length; i++){
                b[i].checked = false;
            }
        }
        GetCount();
    })
    //单选框
    $("input[name='c']").click(function(){
        var flag = true;
        var a = document.getElementById("c1");
        var b = document.getElementsByName("c");
        for(var i = 0; i < b.length; i++){
            if(!b[i].checked){
                flag = false;
                break;
            }
        }
        a.checked = flag;
        GetCount();
    });
    function GetCount()
    {
        //alert("GetCount");
        var conts = 0;
        var aa = 0;
        var len = $(".tot");
        var num = 0;
        var b = document.getElementsByName("c");
        for (var i = 0; i < b.length; i++)
        {
            if(b[i].checked)
            {
                aa++;
                num = parseFloat(num) + parseFloat($(len[i]).text());

            }
        }
        $("#Amount").text(aa);
        $("#Total").html((parseFloat(num).toFixed(2)));
        $("#jz1").css("display", "none");
        $("#jz2").css("display", "block");

    }
</script>
<!---商品加减算总数---->
<script type="text/javascript">
    $(document).ready(function () {
        var size = document.getElementById("size");
        for (var id = 0; id < size.value; id++) {
			var unit_price = document.getElementById("unit_price" + id).innerText;
			var total = document.getElementById("total" + id).innerText;
			var text_box=document.getElementById("text_box"+id);
			total = (parseInt(text_box.value) * unit_price).toFixed(2);
			$("#total" + id).html(total);
    	}
	});

    function minus(obj) {
        //获取onclick的id
        var id = obj.id;
        //获取i的值
        var i=obj.parentNode.parentNode;
        var text_box = document.getElementById("text_box"+i.id);
        if(text_box.value>1){
        	text_box.value = parseInt(text_box.value)-1;
            setTotal(i.id,text_box.value);
            GetCount();
        }
    }

	function add(obj) {
	    //获取onclick的id
        var id = obj.id;
        //获取i的值
        var i=obj.parentNode.parentNode;
        var text_box = document.getElementById("text_box"+i.id);
		text_box.value = parseInt(text_box.value)+1;

		setTotal(i.id,text_box.value);
		GetCount();
    }

    function setTotal(id,value) {
        var unit_price=document.getElementById("unit_price"+id).innerText;
        var total=document.getElementById("total"+id).innerText;
        total=(parseInt(value)*unit_price).toFixed(2);
        $("#total"+id).html(total);
    }

    function Delete(obj) {
        //获取onclick的id
        var id = obj.id;
        //获取i的值
        var i=obj.parentNode.parentNode;
        var check=document.getElementById("newslist-"+i.id);
		document.form1.action='/deleteCartProduct?cart_id='+check.value;
		document.form1.submit();
    }

    function confirmDelete(obj)
    {
        if(confirm('Are you sure to delete?'))
        {
            Delete(obj);
            return true;
        }
        else
            return false;
    }

    function pay() {
        var obj = document.getElementsByName("c");
        check_val = [];
        for (k in obj) {
            if (obj[k].checked)
                check_val.push(obj[k].value);
        }
        if (check_val.length == 0)
            alert("Please select an item!");
        else {
            document.form1.action = '/SettleAccount?cart_id=' + check_val;
            document.form1.submit();
        }
    }
</script>
</html>
