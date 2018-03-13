<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
	<link href="../css/bootstrapValidator.min.css" rel="stylesheet" type="text/css"/>
	<link href="../css/bootstrap-select.min.css" rel="stylesheet">
	<link href="../css/bootstrap-datetimepicker.min.css" rel="stylesheet">
	<link href="../css/fileinput.min.css" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Shop</title>
</head>
<body>
<jsp:include page="../Shared/_SellerManagement.jsp" />
			<ul class="breadcrumb">
				<li class="active">
					 Product Management
				</li>
				<li class="active">
					Product List
				</li>
			</ul>
			

            <button type="button" class="btn btn-primary" onclick="javascrtpt:window.location.href='Add.jsp'">
            <span><img src="../images/t01.png" /></span> Add
            </button>

			<button type="button" class="btn btn-info">
			<span><img src="../images/t02.png" /></span> Edit
			</button>
			<button type="button"  class="btn btn-danger">
			<span><img src="../images/t03.png" /></span> Delete
			</button>

			<table class="table table-striped table-hover">
				<thead>
					<tr>
						<th>
						<input type = "checkbox" id = "allCheck"/>
						</th>
						<th>
							ProductID
						</th>
						<th>
							Picture
						</th>
						<th>
							Name
						</th>
						<th>
							property
						</th>
						<th>
							Category
						</th>
						<th>
							Price
						</th>
						<th>
							Amount
						</th>
						<th>
							Add Time
						</th>
						<th>
							Status
						</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td class="tb2_td1">
							<input type = "checkbox" name = "check"/>
						</td>
						<td>
							1
						</td>
						<td>
							<img alt="no image" src="../images/pc.jpg">
						</td>
						<td>
							01/04/2012
						</td>
						<td>
							Default
						</td>
						<td>
							Default
						</td>
						<td>
							Default
						</td>
						<td>
							Default
						</td>
						<td>
							Default
						</td>
						<td>
							Default
						</td>
					</tr>
					<tr class="success">
						<td class="tb2_td1">
							<input type = "checkbox" name = "check"/>
						</td>
						<td>
							2
						</td>
						<td>
							<img alt="no image" src="../images/pc4.jpg">
						</td>
						<td>
							01/04/2012
						</td>
						<td>
							Approved
						</td>
						<td>
							Approved
						</td>
						<td>
							Approved
						</td>
						<td>
							Approved
						</td>
						<td>
							Approved
						</td>
						<td>
							Approved
						</td>
					</tr>
					<tr class="error">
						<td class="tb2_td1">
							<input type = "checkbox" name = "check"/>
						</td>
						<td>
							3
						</td>
						<td>
							<img alt="no image" src="../images/pc3.jpg">
						</td>
						<td>
							02/04/2012
						</td>
						<td>
							Declined
						</td>
						<td>
							Declined
						</td>
						<td>
							Declined
						</td>
						<td>
							Declined
						</td>
						<td>
							Declined
						</td>
						<td>
							Declined
						</td>
					</tr>
					<tr class="warning">
						<td class="tb2_td1">
							<input type = "checkbox" name = "check"/>
						</td>
						<td>
							4
						</td>
						<td>
							<img alt="no image" src="../images/pc2.jpg">
						</td>
						<td>
							03/04/2012
						</td>
						<td>
							Pending
						</td>
						<td>
							Declined
						</td>
						<td>
							Declined
						</td>
						<td>
							Declined
						</td>
						<td>
							Declined
						</td>
						<td>
							Declined
						</td>
					</tr>
					<tr class="info">
						<td class="tb2_td1">
							<input type = "checkbox" name = "check"/>
						</td>
						<td>
							5
						</td>
						<td>
							<img alt="no image" src="../images/pc1.jpg">
						</td>
						<td>
							04/04/2012
						</td>
						<td>
							Call in to confirm
						</td>
						<td>
							Declined
						</td>
						<td>
							Declined
						</td>
						<td>
							Declined
						</td>
						<td>
							Declined
						</td>
						<td>
							Declined
						</td>
					</tr>
				</tbody>
			</table>

<script src="../js/jquery-3.2.1.min.js" type="text/javascript"></script>
<script src="../js/bootstrap.min.js" type="text/javascript"></script>
<script src="../js/bootstrapValidator.min.js" type="text/javascript"></script>
<script src="../js/bootstrap-select.min.js" type="text/javascript"></script>
<script src="../js/bootstrap-datetimepicker.min.js" type="text/javascript"></script>
<script src="../js/fileinput.min.js" type="text/javascript"></script>



<script type="text/javascript">
    //.datetimepicker(options)初始化日期时间选择器;
    $('#AddDate').datetimepicker({
        minView: "month",
        format : 'yyyy-mm-dd',
        yearStart:2018,
        yearEnd:2018,
        todayBtn : true,
        autoclose : true

    });
</script>

<script>

    $("#ProImage").fileinput({
        uploadUrl: '#', // you must set a valid URL here else you will get an error
        allowedFileExtensions : ['jpg', 'png','gif'],
        overwriteInitial: false,
        maxFileSize: 1000,
        maxFilesNum: 10,
        //allowedFileTypes: ['image', 'video', 'flash'],
        slugCallback: function(filename) {
            return filename.replace('(', '_').replace(']', '_');
        }
    });

</script>


<script>
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
</script>
</body>




</html>