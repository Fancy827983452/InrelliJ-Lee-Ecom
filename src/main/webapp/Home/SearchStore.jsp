<%@ page import="org.apache.ibatis.session.SqlSession" %>
<%@ page import="com.Ecom.dao.MySqlSession" %>
<%@ page import="com.Ecom.mapper.ProductMapper" %>
<%@ page import="com.Ecom.model.Shop" %>
<%@ page import="java.util.List" %>
<%@ page import="com.Ecom.mapper.ShopMapper" %>
<%@ page import="com.Ecom.mapper.UserMapper" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Search Store</title>
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
    <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <script type="text/javascript">
        var message="${param.Message}";
        if(message.length == 0 || null == message)
        {
            message=null;
        }
        else
        {
            alert(message);
            //window.location.href="home.jsp";
        }
    </script>
</head>
<body>
<div class="container">

    <jsp:include page="../Shared/_Layout.jsp" />

    <div style="background-color: rgba(118, 53, 255, 0.12); height: 50px;margin:0 auto;margin-top: 20px;">
        <form action="/searchProduct" method="post">
        <div class="input-group" style="width:500px; height:30px;margin:0 auto;top:10px;">
            <div class="input-group-btn">
                <select  name="keywordStyle" title="Commodity" class="btn btn-default dropdown-toggle">
                    <option>Commodity</option>
                    <option>Store</option>
                </select>
            </div><!-- /btn-group -->
            <input type="text" class="form-control" name="keyword" required>
            <span class="input-group-btn">
						    <input type="submit" class="btn btn-default" value="Search"/>
					    </span>
        </div>
        </form><!-- /input-group -->
    </div><!-- /.col-lg-6 --><br>
    <div>
        <ul class="nav nav-tabs">
            <li><a href="#">Sales</a></li>
            <li><a href="#">Credibility</a></li>
        </ul>
    </div>

    <div style="margin-top:10px;">
        <%
            String keyword = request.getParameter("keyword");

            SqlSession sqlSessions= MySqlSession.getMySession(response);
            ShopMapper shopMapper = sqlSessions.getMapper(ShopMapper.class);

            List<Shop> shopList = null;
            shopList = shopMapper.getShopsByKeyword(keyword);

            for (int i = 0;i<shopList.size();i++)
            {
        %>
        <div class="store">
            <div style="height: 160px; width: 120px; margin-left: 60px;margin-top: 10px;float: left;">
                <img src="http://localhost:8080/userimage/<%=shopList.get(i).getEmail()%>/image" class="img-responsive" alt="">
            </div>
            <div style="float: left; margin-left: 70px;margin-top: 20px;">
                <ul style="list-style-type:none;">
                    <li style="line-height:50px;"><a href="#" style="font-size: 15px;"><%=shopList.get(i).getShop_name()%>></a></li>
                    <li style="line-height:50px;"><a href="#" style="font-size: 15px;">Contact Seller</a></li>
                    <li style="line-height:50px;">
                        <span>Credit Rating :</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <span>Sales Volume :</span>
                    </li>
                </ul>
            </div>

        </div>
        <%
            }
        %>
        <%--<div class="store">--%>
            <%--<div style="height: 160px; width: 120px; margin-left: 60px;margin-top: 10px;float: left;">--%>
                <%--<img src="../images/pc4.jpg" class="img-responsive" alt="">--%>
            <%--</div>--%>
            <%--<div style="float: left; margin-left: 70px;margin-top: 20px;">--%>
                <%--<ul style="list-style-type:none;">--%>
                    <%--<li style="line-height:50px;"><a href="#" style="font-size: 15px;">Store Name</a></li>--%>
                    <%--<li style="line-height:50px;"><a href="#" style="font-size: 15px;">Contact Seller</a></li>--%>
                    <%--<li style="line-height:50px;">--%>
                        <%--<span>Credit Rating :</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;--%>
                        <%--<span>Sales Volume :</span>--%>
                    <%--</li>--%>
                <%--</ul>--%>
            <%--</div>--%>

        <%--</div>--%>

        <%--<div class="store">--%>
            <%--<div style="height: 160px; width: 120px; margin-left: 60px;margin-top: 10px;float: left;">--%>
                <%--<img src="../images/pc4.jpg" class="img-responsive" alt="">--%>
            <%--</div>--%>
            <%--<div style="float: left; margin-left: 70px;margin-top: 20px;">--%>
                <%--<ul style="list-style-type:none;">--%>
                    <%--<li style="line-height:50px;"><a href="#" style="font-size: 15px;">Store Name</a></li>--%>
                    <%--<li style="line-height:50px;"><a href="#" style="font-size: 15px;">Contact Seller</a></li>--%>
                    <%--<li style="line-height:50px;">--%>
                        <%--<span>Credit Rating :</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;--%>
                        <%--<span>Sales Volume :</span>--%>
                    <%--</li>--%>
                <%--</ul>--%>
            <%--</div>--%>

        <%--</div>--%>

        <%--<div class="store">--%>
            <%--<div style="height: 160px; width: 120px; margin-left: 60px;margin-top: 10px;float: left;">--%>
                <%--<img src="../images/pc4.jpg" class="img-responsive" alt="">--%>
            <%--</div>--%>
            <%--<div style="float: left; margin-left: 70px;margin-top: 20px;">--%>
                <%--<ul style="list-style-type:none;">--%>
                    <%--<li style="line-height:50px;"><a href="#" style="font-size: 15px;">Store Name</a></li>--%>
                    <%--<li style="line-height:50px;"><a href="#" style="font-size: 15px;">Contact Seller</a></li>--%>
                    <%--<li style="line-height:50px;">--%>
                        <%--<span>Credit Rating :</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;--%>
                        <%--<span>Sales Volume :</span>--%>
                    <%--</li>--%>
                <%--</ul>--%>
            <%--</div>--%>

        <%--</div>--%>


            <div class="clearfix"></div>
    </div>
    <!--//products-->
    <!-- /.row -->
</div>
</body>
</html>
