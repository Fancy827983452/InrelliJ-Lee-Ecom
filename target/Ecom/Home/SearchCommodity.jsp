<%@ page import="java.util.List" %>
<%@ page import="com.Ecom.model.Product" %>
<%@ page import="org.apache.ibatis.session.SqlSession" %>
<%@ page import="com.Ecom.dao.MySqlSession" %>
<%@ page import="com.Ecom.mapper.ProductMapper" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Search Commodity</title>
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
                     <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                         Commodity
                        <span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu">
                        <li><a href="#">Store</a></li>
                    </ul>
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
            <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                    Price
                    <b class="caret"></b>
                </a>
                <ul class="dropdown-menu">
                    <li><a href="#">From low to high</a></li>
                    <li><a href="#">From high to low</a></li>
                </ul>
            </li>
        </ul>
    </div>

    <div class="content-mid">
        <%

           String keyword = request.getParameter("keyword");

            SqlSession sqlSessions= MySqlSession.getMySession(response);
            ProductMapper productMapper = sqlSessions.getMapper(ProductMapper.class);

            List<Product> productList = productMapper.getProductsByKeyword(keyword);

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
    <script>
        $(function () {

            $("#registeForm").bootstrapValidator({
                message: 'This value is not valid',
                feedbackIcons:{
                    valid:'glyphicon glyphicon-ok',
                    invalid:'glyphicon glyphicon-remove',
                    validating: 'glyphicon glyphicon-refresh'
                },

                fields: {

                    email: {
                        validators: {
                            notEmpty: {
                                message: 'Mail can not be empty.'
                            },
                            emailAddress: {
                                message: 'Please enter the correct e-mail address:123@qq.com.'
                            }
                        }
                    },
                    name: {
                        validators: {
                            notEmpty: {
                                message: 'Username can not be empty.'
                            },
                            stringLength: {
                                /*长度提示*/
                                min: 1,
                                max: 10,
                                message: 'Username must be between 1 and 10 characters in length.'
                            }
                        }
                    },
                    password: {
                        validators: {
                            notEmpty: {
                                message: 'Password can not be blank'
                            },
                            stringLength: {
                                /*长度提示*/
                                min: 3,
                                max: 20,
                                message: 'The password must be 3-20 in length'
                            },
                            regexp: {
                                regexp: /^[a-zA-Z0-9_\.]+$/,
                                message: 'The password consists of alphanumeric characters,_and.'
                            }
                        }
                    },
                    repwd: {
                        message: 'Invalid password.',
                        validators: {
                            notEmpty: {
                                message: 'Password can not be blank'
                            },
                            stringLength: {
                                min: 3,
                                max: 20,
                                message: 'The password must be 3-20 in length.'
                            },
                            identical: {//相同
                                field: 'password',
                                message: 'The password is inconsistent twice'
                            },
                            regexp: {//匹配规则
                                regexp: /^[a-zA-Z0-9_\.]+$/,
                                message: 'The password consists of alphanumeric characters,_and.'
                            }
                        }
                    },
                    Phone:{
                        validators:{
                            notEmpty:{
                                message:'Phone number cannot be valid.'
                            },
                            stringLength:{
                                min:11,
                                max:11,
                                message:'The length of the phone number should be 11 digits.'
                            },
                            regexp: {
                                regexp: /^1[3|5|8]{1}[0-9]{9}$/,
                                message: 'Please enter the right phone number.'
                            }
                        }

                    },



                    Gender:{
                        validators:{
                            notEmpty:{
                                message:'Gender cannot be empty.'
                            }
                        }
                    },


                }

            }),
                $("#submit").click(function(){
                    $("#registeForm").bootstrapValidator('validate');
                });

        });
    </script>
</div>
</body>
</html>
