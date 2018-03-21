<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2018/3/21
  Time: 15:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Check</title>
    <title>Modify Self Address</title>
    <link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="../css/bootstrapValidator.min.css" rel="stylesheet" type="text/css"/>
    <link href="../css/mystyle.css" rel="stylesheet">
    <link href="../css/cart.css" rel="stylesheet">
</head>
<body>
    <div class="container">
        <jsp:include page="../Shared/_Admin.jsp" />
        <ul class="breadcrumb">
            <li class="active">
                Manage Store
            </li>
            <li class="active">
                Audit Store
            </li>
        </ul>
        <table class="table table-bordered" id="checktable">
            <tr style="background-color:#f5f5f5;">
                <td style="width:150px;">Applicant's information</td>
                <td>Time</td>
                <td>Application for store information</td>
                <td>Businese License</td>
            </tr>
            <tr>
                <td>
                    <div style="float:left;width:50%; text-align:center;"><img alt="no image" src="../images/pc.jpg"></div>
                    <div style="float:left;width:50%; text-align:left;">Name :<br>Email ID :<br>Actual Name :<br>Phone :</div>
                </td>
                <td>

                </td>
                <td >
                    Shop Name :<br>
                    Type :<br>
                    Description
                </td>
                <td></td>
            </tr>
            <tr>
                <td colspan=4>
                    <button type="button" class="btn btn-default btn-sm">
                        <span class="glyphicon glyphicon-ok"></span> Ok
                    </button>
                    <button type="button" class="btn btn-default btn-sm">
                        <span class="glyphicon glyphicon-remove"></span> No
                    </button>
                </td>
            </tr>
        </table>

        <table class="table table-bordered" id="checktable">
            <tr style="background-color:#f5f5f5;">
                <td style="width:150px;">Applicant's information</td>
                <td>Time</td>
                <td>Application for store information</td>
                <td>Businese License</td>
            </tr>
            <tr>
                <td>
                    <div style="float:left;width:50%; text-align:center;"><img alt="no image" src="../images/pc.jpg"></div>
                    <div style="float:left;width:50%; text-align:left;">Name :<br>Email ID :<br>Actual Name :<br>Phone :</div>
                </td>
                <td>

                </td>
                <td >
                    Shop Name :<br>
                    Type :<br>
                    Description
                </td>
                <td></td>
            </tr>
            <tr>
                <td colspan=4>
                    <button type="button" class="btn btn-default btn-sm">
                        <span class="glyphicon glyphicon-ok"></span> Ok
                    </button>
                    <button type="button" class="btn btn-default btn-sm">
                        <span class="glyphicon glyphicon-remove"></span> No
                    </button>
                </td>
            </tr>
        </table>

    </div>
</body>
</html>
