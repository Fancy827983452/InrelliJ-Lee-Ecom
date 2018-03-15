<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/3/13
  Time: 10:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="../css/bootstrapValidator.min.css" rel="stylesheet" type="text/css"/>
    <link href="../css/bootstrap-select.min.css" rel="stylesheet">
    <link href="../css/bootstrap-datetimepicker.min.css" rel="stylesheet">
    <link href="../css/fileinput.min.css" rel="stylesheet">
    <link href="../css/multiple-select.css" rel="stylesheet">
    <link href="../css/multi-select.css" rel="stylesheet">
    <title>Add</title>

</head>
<body>
<jsp:include page="../Shared/_SellerManagement.jsp" />
<form class="form-horizontal" id="registeForm" name="registeForm" action="" method="post" >
    <div class="form-group row">
        <label for="ProName" class="col-md-offset-2 col-md-2 control-label" >Product Name:</label>
        <div class="col-md-8"><input type="text" class="form-control" id="ProName" name="ProName"></div>
    </div>

    <div class="form-group row">
        <label for="ProCate" class="col-md-offset-2 col-md-2 control-label" >Product Category:</label>
        <div class="col-md-8">
            <select class="form-control" id="ProCate">
                <option>BOOK</option>
                <option>CLOTHES</option>
                <option>MECHINE</option>
                <option>MEDICINE</option>
            </select>
        </div>
    </div>



    <div class="form-group row">
        <label for="ProPrice" class="col-md-offset-2 col-md-2 control-label" >Product Price:</label>
        <div class="col-md-8"><input type="text" class="form-control" id="ProPrice" name="ProPrice"></div>
    </div>
    <div class="form-group row">
        <label for="ProDetail" class="col-md-offset-2 col-md-2 control-label" >Product Details:</label>
        <div class="col-md-8"><textarea class="form-control" row="3" id="ProDetail" name="ProDetail"></textarea></div>
    </div>
    <div class="form-group row">
        <label for="AddDate" class="col-md-offset-2 col-md-2 control-label" >Add Date:</label>
        <div class="col-md-8"><input type="text" class="form-control" id="AddDate" name="AddDate"></div>
    </div>
    <div class="form-group row">
        <label for="Stock" class="col-md-offset-2 col-md-2 control-label" >Product Stock:</label>
        <div class="col-md-8"><input type="text" class="form-control" id="Stock" name="Stock"></div>
    </div>

    <div class="form-group row">
        <label for="ProProperty" class="col-md-offset-2 col-md-2 control-label" multiple >Product Property:</label>
        <div class="col-md-8">
            <div><button type="button" class="btn btn-default btn-lg" style="border:0;"  data-toggle="modal" data-target="#addProperty"><i class="glyphicon glyphicon-plus"></i></button></div>

                <div class="input-group">
                <span class="input-group-btn"><button class="btn btn-default" type="button" style="width:200px" >color</button></span>
                <input type="text" class="form-control"style="width:350px">
            </div>

        </div>

        <!-- 模态框（Modal） -->
        <div class="modal fade" id="addProperty" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title" id="myModalLabel">Login</h4>
                    </div>
                    <div class="modal-body">

                        <form class="form-horizontal" id="indexform" name="indexForm" action="" method="post" >
                            <div class="form-group row">
                                <label for="ProPro" class="col-md-offset-2 col-md-2 control-label" >Product Property:</label>
                                <div class="col-md-6"><input type="text" class="form-control" id="ProPro" name="ProPro"></div>
                            </div>
                            <div class="form-group">
                                <label for="Detail" class="col-md-offset-2 col-md-2 control-label" >Detail:</label>
                                <div class="col-md-6"><input type="text" class="form-control" name="Detail" id="Detail"></div>
                            </div>
                            <div class="modal-footer">
                                <!--<button type="button" class="btn btn-default" style="border: none">Forget Password</button>-->
                                <center><button type="submit" class="btn btn-primary">Add</button></center>
                            </div>
                        </form>
                    </div>

                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->

    </div>

    <div class="form-group row">
        <label for="ProImage" class="col-md-offset-2 col-md-2 control-label">Product Image:</label>
        <div class="col-sm-8 text-center">
            <div class="container-fluid kv-main container-fluid">
                <div class="form-group"  enctype="multipart/form-data" >
                    <input id="ProImage" type="file" multiple class="file" data-overwrite-initial="false" data-min-file-count="2">
                </div>
            </div>
        </div>
    </div>

    <div class="form-group row">
        <center><button type="submit" class="btn btn-primary" >Add</button></center>
    </div>



</form>
<script src="../js/jquery-3.2.1.min.js" type="text/javascript"></script>
<script src="../js/bootstrap.min.js" type="text/javascript"></script>
<script src="../js/bootstrapValidator.min.js" type="text/javascript"></script>
<script src="../js/bootstrap-select.min.js" type="text/javascript"></script>
<script src="../js/bootstrap-datetimepicker.min.js" type="text/javascript"></script>
<script src="../js/fileinput.min.js" type="text/javascript"></script>
<script src="../js/multiple-select.js" type="text/javascript"></script>
<script src="../js/jquery.multi-select.js" type="text/javascript"></script>
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
        maxFilesNum: 5,
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
