<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>Cart</title>

	<link href="../css/mystyle.css" rel="stylesheet" type="text/css" />

	<script type="text/javascript" src="../js/jquery.1.4.2-min.js"></script>
	<script type="text/javascript" src="../js/Calculation.js"></script>
</head>

<body>
<div class="container">
	<jsp:include page="../Shared/_Layout.jsp"/>
	<div class="gwc" style=" margin:auto;">
		<table cellpadding="0" cellspacing="0" class="gwc_tb1">
			<tr>
				<td class="tb1_td1"><input id="c1" type="checkbox"  class="allselect"/></td>
				<td class="tb1_td1">All</td>
				<td class="tb1_td3">Product</td>
				<td class="tb1_td4">Product Information</td>
				<td class="tb1_td5">Amount</td>
				<td class="tb1_td6">Price</td>
				<td class="tb1_td7"></td>
			</tr>
		</table>

		<table cellpadding="0" cellspacing="0" class="CartTb">
			<tr>
				<td class="tb2_td1"><input type="checkbox" value="1" name="c" id="newslist-1" /></td>
				<td class="tb2_td2"><a href="#"><img src="images/img1.jpg"/></a></td>
				<td class="tb2_td3"><a href="#">Product Name</a></td>
				<td class="tb1_td4">Property</td>
				<td class="tb1_td5">
					<input id="min1" name=""  style=" width:20px; height:24px;border:1px solid #ccc;" type="button" value="-" />
					<input id="text_box1" name="" type="text" value="1" style=" width:30px; text-align:center; border:1px solid #ccc;" />
					<input id="add1" name="" style=" width:20px; height:24px;border:1px solid #ccc;" type="button" value="+" />
				</td>
				<td class="tb1_td6"><label id="total1" class="tot" style="color:#ff5500;font-size:14px; font-weight:bold;"></label></td>
				<td class="tb1_td7"><a href="#">Delete</a></td>
			</tr>
		</table>

		<table cellpadding="0" cellspacing="0" class="CartTb">
			<tr>
				<td class="tb2_td1"><input type="checkbox" value="1" name="c" id="newslist-2" /></td>
				<td class="tb2_td2"><a href="#"><img src="images/img2.jpg"/></a></td>
				<td class="tb2_td3"><a href="#">Product Name</a></td>
				<td class="tb1_td4">Property</td>
				<td class="tb1_td5">
					<input id="min2" name=""  style=" width:20px; height:24px;border:1px solid #ccc;" type="button" value="-" />
					<input id="text_box2" name="" type="text" value="1" style=" width:30px; text-align:center; border:1px solid #ccc;" />
					<input id="add2" name="" style=" width:20px; height:24px;border:1px solid #ccc;" type="button" value="+" />
				</td>
				<td class="tb1_td6"><label id="total2" class="tot" style="color:#ff5500;font-size:14px; font-weight:bold;"></label></td>
				<td class="tb1_td7"><a href="#">Delete</a></td>
			</tr>
		</table>

		<table cellpadding="0" cellspacing="0" class="gwc_tb3">
			<tr>
				<td class="tb1_td1">&nbsp;</td>
				<td class="tb1_td1">&nbsp;</td>
				<td class="tb3_td1">&nbsp;</td>
				<td class="tb3_td2">Seleted: <label id="Amount" style="color:#ff5500;font-size:14px; font-weight:bold;">0</label> </td>
				<td class="tb3_td3">Total:<span style=" color:#ff5500;"><label id="Total" style="color:#ff5500;font-size:14px; font-weight:bold;">0.00</label></span></td>
				<td class="tb3_td4"><span id="jz1">Pay</span><a href="#" style=" display:none;"  class="jz2" id="jz2">Pay</a></td>		</tr>
		</table>
	</div>
</div>
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
                num = parseInt(num) + parseInt($(len[i]).text());

            }
        }
        $("#Amount").text(aa);
        $("#Total").html((parseInt(num).toFixed(2)));
        $("#jz1").css("display", "none");
        $("#jz2").css("display", "block");

    }
</script>
<!---商品加减算总数---->
<script type="text/javascript">
    $(function () {
        var t = $("#text_box1");
        $("#add1").click(function () {
            t.val(parseInt(t.val()) + 1)
            setTotal(); GetCount();
        })
        $("#min1").click(function () {
            if(t.val()>0){
                t.val(parseInt(t.val()) - 1)
                setTotal(); GetCount();
            }
        })
        function setTotal() {

            $("#total1").html((parseInt(t.val()) * 9).toFixed(2));
            $("#newslist-1").val(parseInt(t.val()) * 9);
            //alert(parseInt( $("#newslist-1").val()));
        }
        setTotal();
    })
</script>
<!---商品加减算总数---->
<script type="text/javascript">
    $(function () {
        var t = $("#text_box2");
        $("#add2").click(function () {
            t.val(parseInt(t.val()) + 1)
            setTotal(); GetCount();
        })
        $("#min2").click(function () {
            if(t.val()>0){
                t.val(parseInt(t.val()) - 1)
                setTotal(); GetCount();
            }
        })
        function setTotal() {

            $("#total2").html((parseInt(t.val()) * 8).toFixed(2));
            $("#newslist-2").val(parseInt(t.val()) * 8);
        }
        setTotal();
    })
</script>
</html>
