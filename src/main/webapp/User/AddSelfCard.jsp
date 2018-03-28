<%@ page import="com.Ecom.model.User" %><%--
  Created by IntelliJ IDEA.
  User: ZerounZhang
  Date: 2018/3/28
  Time: 9:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Self Card</title>
</head>
<body>
<jsp:include page="../Shared/_PersonalCenter.jsp" />
<ul class="breadcrumb">
    <li class="active">
        User Management
    </li>
    <li class="active">
        Self Card Management
    </li>
</ul>
<br>
<center>
    <form class="form-horizontal" id="MSelfCardform" name="MSelfCardform" style="width:450px" method="post" action="/addSelfCard">
        <div class="form-group">
            <label for="CardNum" class="col-sm-4 control-label">Card Number: </label>
            <div class="col-sm-8">
                <input type="text" class="form-control" id="CardNum" name="CardNum" value="" placeholder="Card Number"></input>
            </div>
        </div>
        <div class="form-group">
            <label  class="col-sm-4 control-label">Card Type: </label>
            <div class="col-sm-8 radio-list" style="padding-top: 7px;">
                <label>
                    <input name="CardType" id="rd1" value="0" ng-model="vm.bean.sex" checked="checked" class="ng-pristine ng-valid" type="radio"> Deposit Card
                </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <label>
                    <input name="CardType" id="rd2" value="1" ng-model="vm.bean.sex" class="ng-pristine ng-valid" type="radio"> Credit Card
                </label>
            </div>
        </div>
        <div class="form-group">
            <label  class="col-sm-4 control-label">Bank Name: </label>
            <select style="margin-top: 7px;width:280px;" name="BankName">
                <option>ABC</option>
                <option>CCB</option>
                <option>BOC</option>
                <option>ICBC</option>
            </select>
        </div>
        <div class="form-group" style="padding-top: 7px;">
            <label for="CardHolder" class="col-sm-4 control-label">Card Holder: </label>
            <div class="col-sm-8">
                <input type="text" class="form-control" id="CardHolder" name="CardHolder" value="" placeholder="Card Holder"></input>
            </div>
        </div>
        <div class="form-group" style="padding-top: 7px;">
            <label for="ReservePhone" class="col-sm-4 control-label">Reserve Phone: </label>
            <div class="col-sm-8">
                <input type="text" class="form-control" id="ReservePhone" name="ReservePhone" value="" placeholder="Reserve Phone Number"></input>
            </div>
        </div>
        <div class="form-group" style="padding-top: 7px;">
            <label for="Pwd" class="col-sm-4 control-label">Password: </label>
            <div class="col-sm-8">
                <input type="Password" class="form-control" id="Pwd" name="Pwd" value="" placeholder="Password"></input>
                <input type="hidden" class="form-control"  name="email" value="<%=((User)session.getAttribute("user")).getEmail()%>"></input>
            </div>
        </div>
        <button type="submit" class="btn btn-default" >Submit</button>
    </form>
</center>
</body>
</html>
