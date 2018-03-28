<%@ page import="org.apache.ibatis.session.SqlSession" %>
<%@ page import="com.Ecom.dao.MySqlSession" %>
<%@ page import="com.Ecom.mapper.ShopMapper" %>
<%@ page import="java.util.List" %>
<%@ page import="com.Ecom.model.Shop" %>
<%@ page import="com.Ecom.model.User" %>
<%@ page import="com.Ecom.mapper.UserMapper" %><%--
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
    <script type="text/javascript">
        var message="${param.Message}";
        if(message.length == 0 || null == message)
        {
            message=null;
        }
        else
        {
            alert(message);
            window.location.href="Check.jsp";
        }
    </script>
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
        <%
            SqlSession sqlSession= MySqlSession.getMySession(response);
            ShopMapper shopMapper = sqlSession.getMapper(ShopMapper.class);
            UserMapper userMapper = sqlSession.getMapper(UserMapper.class);

            List<Shop> shopList = shopMapper.getUnCheckedShops();

            for (int i=0;i<shopList.size();i++){
                User user = userMapper.getUserByEmail(shopList.get(i).getEmail());
        %>
            <table class="table table-bordered" id="checktable">
                <tr style="background-color:#f5f5f5;">
                    <td style="width:150px;">Applicant's information</td>
                    <td>Time</td>
                    <td>Application for store information</td>
                    <td>Businese License</td>
                </tr>
                <tr>
                    <td>
                        <div style="float:left;width:50%; text-align:center;"><img alt="no image" src="http://localhost:8080/userimage/<%=shopList.get(i).getEmail()%>/image"></div>
                        <div style="float:left;width:50%; text-align:left;">Name :<%=user.getName()%><br>Email ID :<%=user.getEmail()%><br>
                            Actual Name :<%=user.getActual_name()%><br>Phone :<%=user.getPhone()%>
                        </div>
                    </td>
                    <td>
                        <div>
                            <%=shopList.get(i).getEstablish_date()%>
                        </div>
                    </td>
                    <td >
                        Shop Name :<%=shopList.get(i).getShop_name()%><br>
                        <%
                            String type = "";
                            int num = shopList.get(i).getType();
                            if (num==0){
                                type = "Personal";
                            }else {
                                type = "Company";
                            }
                        %>
                        Type :<%=type%><br>
                        Description:<br>&nbsp;&nbsp;<%=shopList.get(i).getDescription()%>
                    </td>
                    <td>

                    </td>
                </tr>
                <tr>
                    <td colspan=4>
                        <form name="form1" method="post" action="/ShopApprove/<%=shopList.get(i).getShop_id()%>">
                            <button type="submit" class="btn btn-default btn-sm">
                                <span class="glyphicon glyphicon-ok"></span> Ok
                            </button>
                        </form>
                        <form name="form1" method="post" action="/ShopDisapprove/<%=shopList.get(i).getShop_id()%>">
                            <button type="submit" class="btn btn-default btn-sm">
                                <span class="glyphicon glyphicon-ok"></span> No
                            </button>
                        </form>
                    </td>
                </tr>
            </table>
        <%
            }
        %>
        <%--<table class="table table-bordered" id="checktable">--%>
            <%--<tr style="background-color:#f5f5f5;">--%>
                <%--<td style="width:150px;">Applicant's information</td>--%>
                <%--<td>Time</td>--%>
                <%--<td>Application for store information</td>--%>
                <%--<td>Businese License</td>--%>
            <%--</tr>--%>
            <%--<tr>--%>
                <%--<td>--%>
                    <%--<div style="float:left;width:50%; text-align:center;"><img alt="no image" src="../images/pc.jpg"></div>--%>
                    <%--<div style="float:left;width:50%; text-align:left;">Name :<br>Email ID :<br>Actual Name :<br>Phone :</div>--%>
                <%--</td>--%>
                <%--<td>--%>

                <%--</td>--%>
                <%--<td >--%>
                    <%--Shop Name :<br>--%>
                    <%--Type :<br>--%>
                    <%--Description--%>
                <%--</td>--%>
                <%--<td></td>--%>
            <%--</tr>--%>
            <%--<tr>--%>
                <%--<td colspan=4>--%>
                    <%--<button type="button" class="btn btn-default btn-sm">--%>
                        <%--<span class="glyphicon glyphicon-ok"></span> Ok--%>
                    <%--</button>--%>
                    <%--<button type="button" class="btn btn-default btn-sm">--%>
                        <%--<span class="glyphicon glyphicon-remove"></span> No--%>
                    <%--</button>--%>
                <%--</td>--%>
            <%--</tr>--%>
        <%--</table>--%>

    </div>
</body>

<%--<script>--%>
    <%--function Approve(shopID)--%>
    <%--{--%>
        <%--document.form1.action='/ShopApprove/'+shopID;--%>
        <%--document.form1.submit();--%>
    <%--}--%>

    <%--function Disapprove(shopID)--%>
    <%--{--%>
        <%--document.form1.action='/ShopDisapprove/'+shopID;--%>
        <%--document.form1.submit();--%>
    <%--}--%>
<%--</script>--%>
</html>
