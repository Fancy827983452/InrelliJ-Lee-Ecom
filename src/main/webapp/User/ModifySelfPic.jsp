<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Shop</title>
</head>
<body>
<jsp:include page="../Shared/_PersonalCenter.jsp" />
<div>
	<ul class="breadcrumb">
				<li class="active">
					 User Management
				</li>
				<li class="active">
					Modify Self Picture
				</li>
			</ul>
	<br>
	<center>
		<form class="form-horizontal" method="post" action="/addUserProfile" enctype="multipart/form-data">
				<div class="row clearfix">
					<div class="col-md-6 column">
						<br/><br/><br/>
						<div class="row clearfix">
							<div class="col-sm-offset-3 col-sm-9">
								<h4>Choose one picture from disk:</h4>
								<input type='file' class="form-control" id="iptfileupload" name="iptfileupload"  value='' required/>
							</div>
						</div>
					</div>
					
					<div class="col-md-6 column">
						<div class="row clearfix">
							<div class="col-md-12 column">
								<h4>Preview:</h4>
								<img src="" id='img' width="200px" height="200px"/>
							</div>
						</div>
					</div>
					<br><br><br><br>
					<div class="row clearfix">
						<div class="col-md-12 column">
							<button type="submit" class="btn btn-default">Submit</button>
						</div>
					</div>
				</div>
		</form>
	</center>
</div>
</body>
<script>
    $(document).ready(function showmsg() {
        var message="${param.ModifyProfileMessage}";
        if(message.length == 0 || null == message)
        {
            message=null;
        }
        else
        {
            alert(message);
            window.location.href="ModifySelfPic.jsp";
        }
    });
</script>

<script>
    //在input file内容改变的时候触发事件
    $('#iptfileupload').change(function(){
        //获取input file的files文件数组;
        //$('#filed')获取的是jQuery对象，.get(0)转为原生对象;
        //这边默认只能选一个，但是存放形式仍然是数组，所以取第一个元素使用[0];
        var file = $('#iptfileupload').get(0).files[0];
        //创建用来读取此文件的对象
        var reader = new FileReader();
        //使用该对象读取file文件
        reader.readAsDataURL(file);
        //读取文件成功后执行的方法函数
        reader.onload=function(e){
            //读取成功后返回的一个参数e，整个的一个进度事件
            console.log(e);
            //选择所要显示图片的img，要赋值给img的src就是e中target下result里面
            //的base64编码格式的地址
            $('#img').get(0).src = e.target.result;
        }
    })
</script>
</html>