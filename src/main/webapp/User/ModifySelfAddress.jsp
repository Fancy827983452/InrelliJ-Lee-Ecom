<%@ page import="com.Ecom.model.Address" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Modify Self Address</title>
    <link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="../css/bootstrapValidator.min.css" rel="stylesheet" type="text/css"/>
    <link href="../css/mystyle.css" rel="stylesheet">
    <link href="../css/cart.css" rel="stylesheet">

    <script>
        window.onload=function () {
            var message="${param.Message}";
            if(message.length == 0 || null == message)
            {
                message=null;
            }
            else
            {
                alert(message);
                //window.location.href="ModifySelfAddress.jsp";
            }
        };
    </script>
</head>

<body>
<div class="container">
    <jsp:include page="../Shared/_SellerManagement.jsp" />
    <ul class="breadcrumb">
        <li class="active">
            User Management
        </li>
        <li class="active">
            Modify Self Address
        </li>
    </ul>


    <a role="button" data-toggle="modal" data-target="#addaddress">
        <span class="glyphicon glyphicon-plus" style="font-size: 18px;">Address</span>
    </a>
    <br/><br/>
    <div class="modal fade" id="addaddress" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="myModalLabel">Add Address</h4>
                </div>
                <div class="modal-body">

                    <form class="form-horizontal" method="post" action="/ModifySelfAddress">
                        <div class="form-group row">
                            <label for="receiver_name" class="col-md-offset-2 col-md-2 control-label" ><span style="color:red">*&nbsp;</span>Receiver Name:</label>
                            <div class="col-md-6"><input type="text" class="form-control" id="receiver_name" name="receiver_name" required></div>
                        </div>
                        <div class="form-group row">
                            <label for="address" class="col-md-offset-2 col-md-2 control-label" ><span style="color:red">*&nbsp;</span>Address:</label>
                            <div class="col-md-6"><input type="text" class="form-control" id="address" name="address" required></div>
                        </div>
                        <div class="form-group row">
                            <label for="phone" class="col-md-offset-2 col-md-2 control-label" ><span style="color:red">*&nbsp;</span>Phone:</label>
                            <div class="col-md-6"><input type="text" class="form-control" id="phone" name="phone" required></div>
                        </div>
                        <div class="form-group row">
                            <label for="zip_code" class="col-md-offset-2 col-md-2 control-label" ><span style="color:red">*&nbsp;</span>Zip Code:</label>
                            <div class="col-md-6"><input type="text" class="form-control" id="zip_code" name="zip_code" required></div>
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
    <table class="table table-hover" id="addresstable">
        <thead>
        <tr>
            <th>Receiver Name</th>
            <th>Address</th>
            <th>Zip Code</th>
            <th>Phone</th>
            <th>Operation</th>
            <th></th>
        </tr>
        </thead>
        <tbody>

        <%
            List<Address> addressList=(List<Address>)session.getAttribute("addressList");
            if(!addressList.isEmpty()){
                for(int i=0;i<addressList.size();i++){//行数
                    %>
                    <tr>
                        <td><%=addressList.get(i).getReceiver_name()%></td>
                        <td><%=addressList.get(i).getAddress()%></td>
                        <td><%=addressList.get(i).getZip_code()%></td>
                        <td><%=addressList.get(i).getPhone()%></td>
                        <td><a role="button" herf="">modify</a>&nbsp;|<a role="button" herf="">delete</a></td>
                        <td>
                        <%
                            if(addressList.get(i).getDefault_address()==0){
                                %><input id="add" class="btn1" type="button" value="Use as Default" /><%
                            }
                            else{
                                %><input id="add" class="btn1" type="button" value="default address"/><%
                            }%></td>
                    <tr>
            <%
                }
            }
        %>

            <%--<c:choose>--%>
                <%--<c:when test="${empty sessionScope.addressList}">--%>
                    <%--<tr>--%>
                        <%--<td colspan="5"><span style="color:red">No Record!</span></td>--%>
                    <%--</tr>--%>
                <%--</c:when>--%>
                <%--<c:otherwise>--%>
                    <%--<c:forEach var="add" items="${sessionScope.addressList}">--%>
                        <%--<tr>--%>
                            <%--<td>${add.receiver_name}</td>--%>
                            <%--<td>${add.address}</td>--%>
                            <%--<td>${add.zip_code}</td>--%>
                            <%--<td>${add.phone}</td>--%>
                            <%--<td><a role="button" herf="">modify</a>&nbsp;|<a role="button" herf="">delete</a></td>--%>
                            <%--<c:choose>--%>
                                <%--<c:when test="${add.default_address}==0">--%>
                                    <%--<td><input id="add" class="btn1" type="button" value="Use as Default" /></td>--%>
                                <%--</c:when>--%>
                                <%--<c:otherwise>--%>
                                    <%--<td><input id="add" class="btn1" type="button" value="default address"/></td>--%>
                                <%--</c:otherwise>--%>
                            <%--</c:choose>--%>
                        <%--</tr>--%>
                    <%--</c:forEach>--%>
                <%--</c:otherwise>--%>
            <%--</c:choose>--%>

        </tbody>
    </table>
    <script src="../js/jquery-3.2.1.min.js" type="text/javascript"></script>
    <script src="../js/bootstrap.min.js" type="text/javascript"></script>
</div>
<body>
</html>