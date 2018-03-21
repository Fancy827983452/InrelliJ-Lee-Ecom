<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2018/3/21
  Time: 15:32
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Shop Management</title>
    <link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="../css/mystyle.css" rel="stylesheet">
</head>

<body>
<div class="container">
    <jsp:include page="../Shared/_Layout.jsp" />
    <div class="row clearfix">
        <div class="col-md-3 column">
            <div class="panel-group" id="accordion">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#accordion"
                               href="#collapseOne">
                                Manage Store
                            </a>
                        </h4>
                    </div>
                    <div id="collapseOne" class="panel-collapse collapse in">
                        <div class="panel-body">
                            <a href="../Admin/Check.jsp">Audit Store</a>
                        </div>
                        <div class="panel-body">
                            <a href="../Shop/ProductManagement.jsp">Product Management</a>
                        </div>
                        <div class="panel-body">
                            <a href="../Shop/ProductCategoryManagement.jsp">Product Category Management</a>
                        </div>
                    </div>
                </div>

                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#accordion"
                               href="#collapseTwo">
                                Manage User
                            </a>
                        </h4>
                    </div>
                    <div id="collapseTwo" class="panel-collapse collapse in">
                        <div class="panel-body">
                            <a href="../Shop/ViewAllOrder.jsp">View Orders</a>
                        </div>
                        <div class="panel-body">
                            <a href="../Shop/ShipManagement.jsp">Ship Management</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-9 column">

