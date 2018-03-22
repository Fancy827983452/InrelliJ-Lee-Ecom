<%@ page import="com.Ecom.model.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="com.Ecom.mapper.ProductMapper" %>
<%@ page import="org.apache.ibatis.session.SqlSession" %>
<%@ page import="com.Ecom.dao.MySqlSession" %>
<%@ page import="com.Ecom.mapper.ShopMapper" %>
<%@ page import="com.Ecom.model.ProductPicture" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Home</title>
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

    <div class="row" style=" padding-top: 17px;">

        <!-- /.col-lg-2 -->

        <div class="col-lg-8">
            <div id="myCarousel" class="carousel slide" data-ride="carousel">
                <!-- 轮播（Carousel）指标 -->
                <ol class="carousel-indicators">
                    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                    <li data-target="#myCarousel" data-slide-to="1"></li>
                    <li data-target="#myCarousel" data-slide-to="2"></li>
                </ol>
                <!-- 轮播（Carousel）项目 -->
                <div class="carousel-inner" role="listbox">
                    <div class="item active">
                        <div class="pic">
                            <div class="col-md-offset-1 col-md-8"><img class="d-block img-fluid" src="../images/pi1.jpg" alt=""/></div>
                        </div>
                    </div>
                    <div class="item">
                        <div class="pic">
                            <div class="col-md-offset-1 col-md-8"><img class="d-block img-fluid" src="../images/pi2.jpg" alt=""/></div>
                        </div>
                    </div>
                    <div class="item">
                        <div class="pic">
                            <div class="col-md-offset-1 col-md-8"><img class="d-block img-fluid" src="../images/pi3.jpg" alt=""/></div>
                        </div>
                    </div>
                </div>
                <a href="#myCarousel" data-slide="prev" class="carousel-control left" >
                    <span class="glyphicon glyphicon-chevron-left"> </span>
                </a>
                <a href="#myCarousel" data-slide="next" class="carousel-control right" >
                    <span class="glyphicon glyphicon-chevron-right"> </span>
                </a>
            </div>
        </div>
        <!-- /.col-lg-8 -->
        <div class="col-lg-4" style="padding-top:90px;">
            <ul class="nav nav-tabs nav-justified" style="width:20px;">
                <li class="active"><a href="#" style="font-size:15px;">Commodity</a></li>
                <li><a href="#" style="font-size:15px;">Store</a></li>
            </ul>
            <div class="input-group">
                <form action="/searchProduct" method="post">
                <input type="text" class="form-control" name="keyword" required>
                <span class="input-group-btn">
						<input type="submit" class="btn btn-default" value="Search"/>
					</span>
                </form>
            </div><!-- /input-group -->
        </div>
    </div>


    <!-- /.row -->
    <div class="content-mid">
        <h3>Trending Items</h3>
        <label class="line"></label>
        <%
            SqlSession sqlSession= MySqlSession.getMySession(response);
            ShopMapper shopMapper = sqlSession.getMapper(ShopMapper.class);
            ProductMapper productMapper = sqlSession.getMapper(ProductMapper.class);

            //获取商品，用于获取商品的id，这里只有一家店铺，之后需要改进
            List<Product> productList = productMapper.getProductList(1);

            int outerRow = productList.size()/4;            //每行展示4个商品
            int outerRowLeft = productList.size()%4;            //如果有商品剩下，那么需要多加一行
            if (outerRowLeft>0) outerRow = outerRow+1;

            int count = 0;            //用于标记商品的计数器

            for (int i = 0;i<outerRow;i++)
            {
        %>
        <div class="mid-popular">
            <%
                for (int j=0;j<4;j++){

                    //统一获取指定的值，方便html的调用
                    int product_id = productList.get(count).getProduct_id();
                    String product_name = productList.get(count).getProduct_name();
                    float product_price = productList.get(count).getUnit_price();
            %>
            <div class="col-md-3 item-grid simpleCart_shelfItem">
                <div class=" mid-pop">
                    <div class="pro-img">
                        <img src="http://localhost:8080/productimage/<%=product_id%>/<%=0%>" class="img-responsive" alt="">
                        <div class="zoom-icon ">
                            <a class="picture" href="http://localhost:8080/productimage/<%=product_id%>/<%=0%>" rel="title" class="b-link-stripe b-animate-go  thickbox"><i class="glyphicon glyphicon-search icon "></i></a>
                            <a href="http://localhost:8080/productinfo/<%=product_id%>"><i class="glyphicon glyphicon-menu-right icon"></i></a>
                        </div>
                    </div>
                    <div class="mid-1">
                        <div class="women">
                            <div class="women-top">
                                <span>Women</span>
                                <h6><a href="http://localhost:8080/productinfo/<%=product_id%>"><%=product_name%></a></h6>
                            </div>
                            <div class="img item_add">
                                <a href="#"><img src="../images/ca.png" alt=""></a>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                        <div class="mid-2">
                            <p ><label>$100.00</label><em class="item_price">$<%=product_price%></em></p>
                            <div class="block">
                                <div class="starbox small ghosting"> </div>
                            </div>

                            <div class="clearfix"></div>
                        </div>

                    </div>
                </div>
            </div>
            <%
                    count++;
                }
            %>
            <div class="clearfix"></div>
        </div>
        <%
            }
        %>
    </div>
    <!--//products-->
    <!-- /.row -->
</div>



<script src="../js/jquery-3.2.1.min.js" type="text/javascript"></script>
<script src="../js/bootstrap.min.js" type="text/javascript"></script>
<script src="../js/bootstrapValidator.min.js" type="text/javascript"></script>
<script src="../js/jstarbox.js" type="text/javascript"></script>
<script src="../js/jquery.magnific-popup.js" type="text/javascript"></script>
<script src="../js/classie.js" type="text/javascript"></script>
<script src="../js/imagezoom.js" type="text/javascript"></script>
<script src="../js/jquery.chocolat.js" type="text/javascript"></script>
<script src="../js/jquery.flexslider.js" type="text/javascript"></script>
<script src="../js/simpleCart.min.js" type="text/javascript"></script>
<script src="../js/uisearch.js" type="text/javascript"></script>
<script src="../js/modernizr.custom.72111.js" type="text/javascript"></script>

<script type="text/javascript">
    jQuery(function() {
        jQuery('.starbox').each(function() {
            var starbox = jQuery(this);
            starbox.starbox({
                average: starbox.attr('data-start-value'),
                changeable: starbox.hasClass('unchangeable') ? false : starbox.hasClass('clickonce') ? 'once' : true,
                ghosting: starbox.hasClass('ghosting'),
                autoUpdateAverage: starbox.hasClass('autoupdate'),
                buttons: starbox.hasClass('smooth') ? false : starbox.attr('data-button-count') || 5,
                stars: starbox.attr('data-star-count') || 5
            }).bind('starbox-value-changed', function(event, value) {
                if(starbox.hasClass('random')) {
                    var val = Math.random();
                    starbox.next().text(' '+val);
                    return val;
                }
            })
        });
    });
</script>

<script type="text/javascript" charset="utf-8">
    $(function() {
        $('a.picture').Chocolat();
    });
</script>


</body>
</html>
