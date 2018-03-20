<%@ page import="java.util.List" %>
<%@ page import="com.Ecom.model.ProductCategory" %>
<%@ page import="com.Ecom.model.Product" %>
<%@ page import="com.Ecom.model.ProductPicture" %>
<%@ page import="com.Ecom.model.ProductProperty" %>
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
    <title>Edit Product</title>

</head>
<body>
<jsp:include page="../Shared/_ShopManagement.jsp" />

<ul class="breadcrumb">
    <li class="active">
        Product Management
    </li>
    <li class="active">
        Product List
    </li>
    <li class="active">
        Edit Product
    </li>
</ul>
<%
    List <Product> productList=(List <Product>)session.getAttribute("productList");
    int product_id=Integer.parseInt(request.getParameter("product_id"));
    if(productList != null && !"".equals(productList))
    {
        for(int i=0;i<productList.size();i++)
        {
            if(productList.get(i).getProduct_id()==product_id)
            {
%>
<form class="form-horizontal" id="ProregisteForm" name="ProregisteForm" action="/EditProduct/<%=product_id%>" method="post" enctype="multipart/form-data">
    <center>
        <div class="form-group row">
            <label for="product_name" class="col-md-3 control-label" >Product Name:</label>
            <div class="col-md-8"><input type="text" class="form-control" id="product_name" name="product_name" value="<%=productList.get(i).getProduct_name()%>"></div>
        </div>

        <div class="form-group row">
            <label for="category_id" class="col-md-3 control-label" >Product Category:</label>
            <div class="col-md-7">
                <select class="form-control" id="category_id" name="category_id">
                    <%
                        List<ProductCategory> categoryNames=(List<ProductCategory>)session.getAttribute("categoryNames");
                        if(!categoryNames.isEmpty()) {
                            for (int j = 0; j < categoryNames.size(); j++) {
                                //找到数据库中存储的category_id
                                if(productList.get(i).getCategory_id()==categoryNames.get(j).getCategory_id())
                                {
                                    %>
                                    <option value="<%=categoryNames.get(j).getCategory_id()%>" selected><%=categoryNames.get(j).getCategory_name()%></option>
                                    <%
                                 }
                                else
                                 {
                                    %>
                                    <option value="<%=categoryNames.get(j).getCategory_id()%>"><%=categoryNames.get(j).getCategory_name()%></option>
                                    <%
                                 }
                            }
                        }
                    %>
                </select>
            </div>
            <div class="col-md-1">
                <button type="button" class="btn btn-default btn-lg" style="border:0;"  data-toggle="modal" data-target="#addCategory">
                    <span class="glyphicon glyphicon-plus"></span>
                </button>
            </div>
        </div>

        <%
            //指定商品的属性和图片
            List<ProductPicture> productPictureList=(List<ProductPicture>)session.getAttribute("productPictureList");
            List<ProductProperty> productPropertyList=(List<ProductProperty>)session.getAttribute("productPropertyList");
            int pictureCount=Integer.parseInt(request.getParameter("pictureCount"));
            int propertyCount=Integer.parseInt(request.getParameter("propertyCount"));
        %>

        <div class="form-group row">
            <label for="addProperty" class="col-md-3 control-label" multiple >Product Property:</label>
            <input name="propertyNum" id="propertyNum" type="hidden" value="">
            <div class="col-md-7">
                <label style="float: left;margin-left: 78px;">Property Name</label>
                <label style="float: left;margin-left: 114px;">Price</label>
                <label style="float: right;margin-right: 40px">Stock</label>
            </div>
            <div class="col-md-7" id="addProperty_Space">
                <div class="input-group" id="addProperty" name="addProperty">
                    <%
                        for(int a=0;a<propertyCount;a++)
                        {
                    %>
                        <input id="property_id<%=a%>" name="property_id<%=a%>" value="<%=productPropertyList.get(a).getProperty_id()%>" type="hidden">
                        <input id="property_name<%=a%>" name="property_name<%=a%>" value="<%=productPropertyList.get(a).getProperty_name()%>" class="btn btn-default" style="width:250px" placeholder="Property Name" required></input>
                        <input id="unit_price<%=a%>" name="unit_price<%=a%>" value="<%=productPropertyList.get(a).getUnit_price()%>" class="btn btn-default" style="width:115px" placeholder="Price" required></input>
                        <input id="stock<%=a%>" name="stock<%=a%>" value="<%=productPropertyList.get(a).getStock()%>" class="btn btn-default" style="width:115px" placeholder="Stock" required></input>
                    <%
                        }
                    %>
                </div>
                <div name="addProperty_Space">

                </div>
            </div>
            <%--<div class="col-md-1">--%>
                <%--<button type="button" class="btn btn-default btn-lg" style="border:0;" onclick="addProperty()">--%>
                    <%--<i class="glyphicon glyphicon-plus"></i>--%>
                <%--</button>--%>
            <%--</div>--%>
        </div>

        <div class="form-group row">
            <label class="col-md-3 control-label">Product Image:</label>
            <div class="col-sm-7">
                <div class="container-fluid kv-main">
                    <input name="imageNum" id="imageNum" type="hidden" value="">
                    <div id="addProductImage" name="addProductImage" class="form-group"  enctype="multipart/form-data" >
                        <%--<div class="form-inline">--%>
                            <%--<span style="float: left;font-weight: bold" class="control-label">Input the sequence of Image you want to change:</span>--%>
                            <%--<input style="width: 150px" name="sequence0" id="sequence0" class="form-control" PLACEHOLDER="Sequence"/>--%>
                        <%--</div>--%>
                        <%--<input name="image" id="image" class="form-control" type="file" accept="image/*">--%>
                        <%--<br/>--%>
                    </div>
                    <div>
                        <table class="table-responsive table">
                            <tr>
                                <td>Sequence</td>
                                <td>Image</td>
                            </tr>
                        <%
                            for(int b=0;b<pictureCount;b++)
                            {
                        %>
                                <tr>
                                    <td><%=b+1%></td>
                                    <td>
                                        <img  alt="no image" style="height: 80px;width: 80px" src="http://localhost:8080/productimage/<%=productList.get(i).getProduct_id()%>/<%=b+1%>">
                                    </td>
                                </tr>
                        <%
                            }
                        %>
                        </table>
                    </div>
                </div>
            </div>
            <div class="col-md-1">
                <button type="button" class="btn btn-default btn-lg" style="border:0;" onclick="addProductImage()">
                    <i class="glyphicon glyphicon-plus"></i>
                </button>
            </div>
        </div>

        <div class="form-group row">
            <label for="details" class="col-md-3 control-label" >Product Details:</label>
            <div class="col-md-8"><textarea class="form-control" row="3" id="details" name="details"><%=productList.get(i).getDetails()%></textarea></div>
        </div>

        <div class="form-group row">
            <center><button type="submit" class="btn btn-primary" onclick="count()">Edit</button></center>
        </div>
    </center>
</form>
<%
            }
        }
    }
%>

<!-- 模态框（Modal） -->
<div class="modal fade" id="addCategory" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">Add Category</h4>
            </div>
            <div class="modal-body">

                <form action="/AddProductCategory" method="post"  class="form-horizontal">
                    <div class="form-group row">
                        <label for="category_name" class="col-md-4 control-label" >Category Name:</label>
                        <div class="col-md-6"><input type="text" class="form-control" id="category_name" name="category_name"></div>
                        <div class="col-md-2"><input type="submit" class="btn btn-primary" value="Add"></div>
                    </div>
                </form>
            </div>

        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->


<script src="../js/jquery-3.2.1.min.js" type="text/javascript"></script>
<script src="../js/bootstrap.min.js" type="text/javascript"></script>
<script src="../js/bootstrapValidator.min.js" type="text/javascript"></script>
<script src="../js/bootstrap-select.min.js" type="text/javascript"></script>
<script src="../js/bootstrap-datetimepicker.min.js" type="text/javascript"></script>
<script src="../js/fileinput.min.js" type="text/javascript"></script>
<script src="../js/multiple-select.js" type="text/javascript"></script>
<script src="../js/jquery.multi-select.js" type="text/javascript"></script>

<script>
    function addProperty() {
        var divNum=document.getElementById("addProperty_Space").children.length;
        $("#addProperty_Space").append('<div class="input-group" id="addProperty'+divNum+'" name="addProperty'+divNum+'">' +
            '<input id="property_name'+divNum+'" name="property_name'+divNum+'" class="btn btn-default" style="width:250px" placeholder="Property Name" required></input>\n' +
            '<input id="unit_price'+divNum+'" name="unit_price'+divNum+'" class="btn btn-default" style="width:115px" placeholder="Price" required></input>\n' +
            '<input id="stock'+divNum+'" name="stock'+divNum+'" class="btn btn-default" style="width:115px" placeholder="Stock" required></input></div>');
    }

    function addProductImage() {
        var divNum=document.getElementById("addProductImage").children.length/3;
        $("#addProductImage").append('<div class="form-inline">' +
            '<span style="float: left;font-weight: bold" class="control-label">Input the sequence of Image you want to change:</span> ' +
            '<input style="width: 150px" name="sequence'+divNum+'" id="sequence'+divNum+'" class="form-control" PLACEHOLDER="Sequence"/></div>'+
            '<input name="image'+divNum+'" id="image'+divNum+'" class="form-control" type="file" accept="image/*"><br/>');
        // alert(divNum);
    }

    function count() {
        var divNum=document.getElementById("addProperty_Space").children.length;
        var propertyNum=document.getElementById("propertyNum");
        propertyNum.value=divNum;

        var divNum2=document.getElementById("addProductImage").children.length/3;
        var imageNum=document.getElementById("imageNum");
        imageNum.value=divNum2;
        //alert("propertyNum= "+propertyNum.value+", imageNum= "+imageNum.value);
    }

    window.onload=function showmsg() {
        var message="${param.Message}";
        if(message.length == 0 || null == message)
        {
            message=null;
        }
        else
        {
            alert(message);
            window.location.href="AddProduct.jsp";
        }
    };
</script>


</body>
</html>
