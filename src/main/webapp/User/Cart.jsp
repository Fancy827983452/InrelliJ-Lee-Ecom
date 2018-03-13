<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Cart</title>
<link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
<link href="../css/bootstrapValidator.min.css" rel="stylesheet" type="text/css"/>
<link href="../css/style.css" rel="stylesheet">
<link href="../css/style4.css" rel="stylesheet">
<link href="../css/jstarbox.css" rel="stylesheet">
<link href="../css/popuo-box.css" rel="stylesheet">
<link href="../css/chocolat.css" rel="stylesheet">
<link href="../css/form.css" rel="stylesheet">
<link href="../css/flexslider.css" rel="stylesheet">
<link href="../css/mystyle.css" rel="stylesheet">
<link href="../css/cart.css" rel="stylesheet">

</head>
<body>
	<div class="container">
	
	<jsp:include page="../Shared/_Layout.jsp" />
	<table class="" cellspacing="0" style='width:100%;'>
		<thead>
			<tr>				
				<th colspan=3 >Product</th>			
				<th>Price</th>
				<th>Number</th>
				<th>Total</th>
			
			</tr>
		</thead>
		<tbody>		
			<tr>
				<td>
					<input type="checkbox" name="check"/>
				</td>
				<td>
					<div>
						<div>
							<a href="">
								<img width="90" height="90" src="../images/pc1.jpg"/>
							</a>
						</div>					
					</div>
					<!-- Product Name -->
							
				</td>
				<td>
					<a href="">Product Name</a>
				</td>
				<td>
					<span class="amount">&yen;2800</span>
				</td>
				<td>
					<div class="gw_num">
						<em class="jian">-</em>
						<input type="text" value="1" class="num"/>
						<em class="add">+</em>
					</div>
				</td>
				<td>
					<span class="amount">&yen;2800</span>
				</td>
					
			</tr>
			<tr>
				<td>
					<input type="checkbox" name="check"/>
				</td>
				<td>
					<div>
						<div>
							<a href="">
								<img width="90" height="90" src="../images/pc1.jpg"/>
							</a>
						</div>					
					</div>
					<!-- Product Name -->
							
				</td>
				<td>
					<a href="">Product Name</a>
				</td>
				<td>
					<span class="amount">&yen;2800</span>
				</td>
				<td>
					<div class="gw_num">
						<em class="jian">-</em>
						<input type="text" value="1" class="num"/>
						<em class="add">+</em>
					</div>
				</td>
				<td>
					<span class="amount">&yen;2800</span>
				</td>
					
			</tr>
			<tr>
				<td>
					<input type="checkbox" name="check"/>
				</td>
				<td>
					<div>
						<div>
							<a href="">
								<img width="90" height="90" src="../images/pc1.jpg"/>
							</a>
						</div>					
					</div>
					<!-- Product Name -->
							
				</td>
				<td>
					<a href="">Product Name</a>
				</td>
				<td>
					<span class="amount">&yen;2800</span>
				</td>
				<td>
					<div class="gw_num">
						<em class="jian">-</em>
						<input type="text" value="1" class="num"/>
						<em class="add">+</em>
					</div>
				</td>
				<td>
					<span class="amount">&yen;2800</span>
				</td>
					
			</tr>
			<tr>
				<td>
					<input type="checkbox" name="check"/>
				</td>
				<td>
					<div>
						<div>
							<a href="">
								<img width="90" height="90" src="../images/pc1.jpg"/>
							</a>
						</div>					
					</div>
					<!-- Product Name -->
							
				</td>
				<td>
					<a href="">Product Name</a>
				</td>
				<td>
					<span class="amount">&yen;2800</span>
				</td>
				<td>
					<div class="gw_num">
						<em class="jian">-</em>
						<input type="text" value="1" class="num"/>
						<em class="add">+</em>
					</div>
				</td>
				<td>
					<span class="amount">&yen;2800</span>
				</td>
					
			</tr>
			<tr>
				<td>
					<input type="checkbox" name="check"/>
				</td>
				<td>
					<div>
						<div>
							<a href="">
								<img width="90" height="90" src="../images/pc1.jpg"/>
							</a>
						</div>					
					</div>
					<!-- Product Name -->
							
				</td>
				<td>
					<a href="">Product Name</a>
				</td>
				<td>
					<span class="amount">&yen;2800</span>
				</td>
				<td>
					<div class="gw_num">
						<em class="jian">-</em>
						<input type="text" value="1" class="num"/>
						<em class="add">+</em>
					</div>
				</td>
				<td>
					<span class="amount">&yen;2800</span>
				</td>
					
			</tr>
			<tr>
				<td>
					<input type="checkbox" name="check"/>
				</td>
				<td>
					<div>
						<div>
							<a href="">
								<img width="90" height="90" src="../images/pc1.jpg"/>
							</a>
						</div>					
					</div>
					<!-- Product Name -->
							
				</td>
				<td>
					<a href="">Product Name</a>
				</td>
				<td>
					<span class="amount">&yen;2800</span>
				</td>
				<td>
					<div class="gw_num">
						<em class="jian">-</em>
						<input type="text" value="1" class="num"/>
						<em class="add">+</em>
					</div>
				</td>
				<td>
					<span class="amount">&yen;2800</span>
				</td>
					
			</tr>
		</tbody>
	</table>
	<center>
	<table cellpadding="0" cellspacing="0"  class="footer">
		<tr>
			<td><input type="checkbox" id="allCheck"/></td>
			<td><font size="4" color="black">The selected number: </font>
				<label id="shuliang" style="color:#ff5500;font-size:14px; font-weight:bold;">0</label>
			</td>
			<td><font size="4" color="black">Total:<span>&yen;</span></font>
				<span style=" color:#ff5500;">
					<label id="zong1" style="color:#ff5500;font-size:14px; font-weight:bold;"></label>
				</span>
			</td>
			<td class="tb3_td4"><a href="#" class="jz2" id="jz2">Pay</a></td>
		</tr>
	</table>
	</center>
	</div>
</body>
<script type="text/javascript" src="http://apps.bdimg.com/libs/jquery/2.1.1/jquery.min.js"></script>

	<script type="text/javascript">
		$(document).ready(function(){
			//加的效果
			$(".add").click(function(){
			var n=$(this).prev().val();
			var num=parseInt(n)+1;
			if(num==0){ return;}
			$(this).prev().val(num);
			});
			//减的效果
			$(".jian").click(function(){
			var n=$(this).next().val();
			var num=parseInt(n)-1;
			if(num==0){ return}
			$(this).next().val(num);
			});
			//全选框
			$("#allCheck").click(function(){
				var a = document.getElementById("allCheck");
				var b = document.getElementsByName("check");
				if(a.checked){
					for(var i = 0; i < b.length; i++){
						b[i].checked = true;
					}
				}else{
					for(var i = 0; i < b.length; i++){
						b[i].checked = false;
					}
				}
			})
			//单选框
			$("input[name='check']").click(function(){
				var flag = true;
				var a = document.getElementById("allCheck");
				var b = document.getElementsByName("check");
				for(var i = 0; i < b.length; i++){
					if(!b[i].checked){
						flag = false;
						break;
					}
				}
				a.checked = flag;
			});
		})
		
	</script>
</html>