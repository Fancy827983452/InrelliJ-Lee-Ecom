<%@ page import="org.apache.ibatis.session.SqlSession" %>
<%@ page import="com.Ecom.dao.MySqlSession" %>
<%@ page import="com.Ecom.mapper.ProductMapper" %>
<%@ page import="com.Ecom.model.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="com.Ecom.model.ProductProperty" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<% String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path; %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Home</title>
    <link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="../css/bootstrapValidator.min.css" rel="stylesheet" type="text/css"/>
    <link href="../css/style.css" rel="stylesheet">
    <link href="../css/style1.css" rel="stylesheet">
    <link href="../css/style4.css" rel="stylesheet">
    <link href="../css/jstarbox.css" rel="stylesheet">
    <link href="../css/popuo-box.css" rel="stylesheet">
    <link href="../css/chocolat.css" rel="stylesheet">
    <link href="../css/form.css" rel="stylesheet">
    <link href="../css/swiper.css" rel="stylesheet">
    <link href="../css/mystyle.css" rel="stylesheet">
    <link href="../css/memenu.css" rel="stylesheet">
</head>
<body>

<style>

    .pc-slide {
        width: 300px;
        margin: 0 auto;
    }

    .view .swiper-container {
        width: 300px;
        height: 500px;
    }


    .preview {
        width: 100%;
        margin-top: 10px;
        position: relative;
    }

    .preview .swiper-container {
        width: 300px;
        height: 82px;

    }

    .preview .swiper-slide {
        width: 87px;
        height: 82px;
    }

    .preview .slide6 {
        width: 82px;
    }

    .preview .arrow-left {
        background: url(../images/feel3.png) no-repeat left top;
        position: absolute;
        left: 10px;
        top: 50%;
        margin-top: -9px;
        width: 9px;
        height: 18px;
        z-index: 10;
    }

    .preview .arrow-right {
        background: url(../images/feel4.png) no-repeat left bottom;
        position: absolute;
        right: 10px;
        top: 50%;
        margin-top: -9px;
        width: 9px;
        height: 18px;
        z-index: 10;
    }

    .preview img {
        padding: 1px;
    }

    .preview .active-nav img {
        padding: 0;
        border: 1px solid #F00;
    }
</style>

<div class="container">

    <jsp:include page="../Shared/_Layout.jsp" />

    <div class="col-md-9">
        <div class="col-md-5 grid">
            <div class="pc-slide">
                <div class="view">
                    <div class="swiper-container">
                        <div class="swiper-wrapper">
                            <%
                                int product_id = Integer.parseInt(request.getParameter("product_id"));
                                int size = Integer.parseInt(request.getParameter("size"));

                                for (int i = 0;i<size;i++){
                            %>
                            <div class="swiper-slide">
                                <a target="_blank"><img src="http://localhost:8080/productimage/<%=product_id%>/<%=i%>" alt=""></a>
                            </div>
                            <%
                                }
                            %>
                        </div>
                    </div>
                </div>
                <div class="preview">
                    <a class="arrow-left" href="#"></a>
                    <a class="arrow-right" href="#"></a>
                    <center>
                    <div class="swiper-container">
                        <div class="swiper-wrapper">
                            <%
                                for (int i=0;i<size;i++){
                            %>
                            <div class="swiper-slide active-nav">
                                <img src="http://localhost:8080/productimage/<%=product_id%>/<%=i%>" height="60%" width="60%" alt="">
                            </div>
                            <%
                                }
                            %>
                        </div>
                    </div>
                    </center>
                </div>
            </div>
        </div>
        <div class="col-md-7 single-top-in">
            <div class="single-para simpleCart_shelfItem">
                <%
                    SqlSession sqlSessions= MySqlSession.getMySession(response);
                    ProductMapper productMapper = sqlSessions.getMapper(ProductMapper.class);

                    Product product = productMapper.getProductById(product_id);
                    String name = product.getProduct_name();
                    float price = product.getUnit_price();
                    String details = product.getDetails();

                    List<ProductProperty> propertyList = productMapper.getPropertiesById(product_id);
                %>
                <h1><%=name%></h1>
                <p><%=details%></p>
                <div class="star-on">
                    <ul>
                        <li><a href="#"><i class="glyphicon glyphicon-star"> </i></a></li>
                        <li><a href="#"><i class="glyphicon glyphicon-star"> </i></a></li>
                        <li><a href="#"><i class="glyphicon glyphicon-star"> </i></a></li>
                        <li><a href="#"><i class="glyphicon glyphicon-star"> </i></a></li>
                        <li><a href="#"><i class="glyphicon glyphicon-star"> </i></a></li>
                    </ul>
                    <div class="review">
                        <a onclick="isHidden('review')">  reviews </a>/
                        <SCRIPT>
                            function isHidden(oDiv){
                                var vDiv = document.getElementById(oDiv);
                                vDiv.style.display = (vDiv.style.display == 'none')?'block':'none';
                            }
                        </SCRIPT>

                        <a href="#">  Write a review</a>
                    </div>
                    <div class="clearfix"> </div>
                </div>

                <label  class="add-to item_price" id="unit_price">$<%=price%></label>
                <input type="hidden" id="hiddenprice" value="<%=propertyList.get(0).getUnit_price()%>"/>

                <script type="text/javascript">
                    function changePrice(price) {
                        document.getElementById("unit_price").innerHTML = "$"+price;
                        document.getElementById("hiddenprice").value = "$"+price;
                    }

                </script>

                <div class="available">
                    <h6>Available Options :</h6>
                    <ul>
                        <%
                            String propertyName = propertyList.get(0).getProperty_name();
                        %>
                        <li>
                            <input type="radio" name="property" value="<%=propertyName%>" onclick="changePrice(<%=propertyList.get(0).getUnit_price()%>)" checked/><%=propertyName%>
                        </li>
                        <%
                            for (int i = 1;i<propertyList.size();i++){
                                propertyName = propertyList.get(i).getProperty_name();
                        %>
                        <li>
                            <input type="radio" name="property" value="<%=propertyName%>" onclick="changePrice(<%=propertyList.get(i).getUnit_price()%>)"/><%=propertyName%>
                        </li>
                        <%
                            }
                        %>
                    </ul>
                </div>
                <div>
                    <ul>
                        <li><a class="cart item_add" role="button" data-toggle="modal" data-target="#add2cart">
                            <span class="glyphicon"></span> Add To Cart</a>
                        </li>
                        <a href="#" class="cart item_add">Buy Now</a>
                    </ul>
                </div>
            </div>
        </div>
        <div class="clearfix"> </div>
        <div class="content-top1">
            <div class="col-md-4 col-md3">
                <div class="col-md1 simpleCart_shelfItem">
                    <a href="../Shop/ProductInfo.jsp">
                        <img class="img-responsive" src="../images/pi6.png" alt="" />
                    </a>
                    <h3><a href="../Shop/ProductInfo.jsp">Jeans</a></h3>
                    <div class="price">
                        <h5 class="item_price">$300</h5>
                        <a href="#" class="item_add">Add To Cart</a>
                        <div class="clearfix"> </div>
                    </div>
                </div>
            </div>
            <div class="col-md-4 col-md3">
                <div class="col-md1 simpleCart_shelfItem">
                    <a href="../Shop/ProductInfo.jsp">
                        <img class="img-responsive" src="../images/pi7.png" alt="" />
                    </a>
                    <h3><a href="../Shop/ProductInfo.jsp">Tops</a></h3>
                    <div class="price">
                        <h5 class="item_price">$300</h5>
                        <a href="#" class="item_add">Add To Cart</a>
                        <div class="clearfix"> </div>
                    </div>

                </div>
            </div>
            <div class="col-md-4 col-md3">
                <div class="col-md1 simpleCart_shelfItem">
                    <a href="../Shop/ProductInfo.jsp">
                        <img class="img-responsive" src="../images/pi.png" alt="" />
                    </a>
                    <h3><a href="../Shop/ProductInfo.jsp">Tops</a></h3>
                    <div class="price">
                        <h5 class="item_price">$300</h5>
                        <a href="#" class="item_add">Add To Cart</a>
                        <div class="clearfix"> </div>
                    </div>

                </div>
            </div>

            <div class="clearfix"> </div>
        </div>
        <div id="review" style="display:none">
            show your review
            <c:forEach>

            </c:forEach>
        </div>

    </div>
    <div class="col-md-3 product-bottom">
        <!--categories-->
        <div class=" rsidebar span_1_of_left">
            <h3 class="cate">Categories</h3>
            <ul class="menu-drop">
                <li class="item1"><a href="#">Men </a>
                    <ul class="cute">
                        <li class="subitem1"><a href="../Shop/ProductInfo.jsp">Cute Kittens </a></li>
                        <li class="subitem2"><a href="../Shop/ProductInfo.jsp">Strange Stuff </a></li>
                        <li class="subitem3"><a href="../Shop/ProductInfo.jsp">Automatic Fails </a></li>
                    </ul>
                </li>
                <li class="item2"><a href="#">Women </a>
                    <ul class="cute">
                        <li class="subitem1"><a href="../Shop/ProductInfo.jsp">Cute Kittens </a></li>
                        <li class="subitem2"><a href="../Shop/ProductInfo.jsp">Strange Stuff </a></li>
                        <li class="subitem3"><a href="../Shop/ProductInfo.jsp">Automatic Fails </a></li>
                    </ul>
                </li>
                <li class="item3"><a href="#">Kids</a>
                    <ul class="cute">
                        <li class="subitem1"><a href="../Shop/ProductInfo.jsp">Cute Kittens </a></li>
                        <li class="subitem2"><a href="../Shop/ProductInfo.jsp">Strange Stuff </a></li>
                        <li class="subitem3"><a href="../Shop/ProductInfo.jsp">Automatic Fails</a></li>
                    </ul>
                </li>
                <li class="item4"><a href="#">Accesories</a>
                    <ul class="cute">
                        <li class="subitem1"><a href="../Shop/ProductInfo.jsp">Cute Kittens </a></li>
                        <li class="subitem2"><a href="../Shop/ProductInfo.jsp">Strange Stuff </a></li>
                        <li class="subitem3"><a href="../Shop/ProductInfo.jsp">Automatic Fails</a></li>
                    </ul>
                </li>

                <li class="item4"><a href="#">Shoes</a>
                    <ul class="cute">
                        <li class="subitem1"><a href="../Shop/ProductInfo.jsp">Cute Kittens </a></li>
                        <li class="subitem2"><a href="../Shop/ProductInfo.jsp">Strange Stuff </a></li>
                        <li class="subitem3"><a href="../Shop/ProductInfo.jsp">Automatic Fails </a></li>
                    </ul>
                </li>
            </ul>
        </div>
        <!--initiate accordion-->
        <script type="text/javascript">
            $(function() {
                var menu_ul = $('.menu-drop > li > ul'),
                    menu_a  = $('.menu-drop > li > a');
                menu_ul.hide();
                menu_a.click(function(e) {
                    e.preventDefault();
                    if(!$(this).hasClass('active')) {
                        menu_a.removeClass('active');
                        menu_ul.filter(':visible').slideUp('normal');
                        $(this).addClass('active').next().stop(true,true).slideDown('normal');
                    } else {
                        $(this).removeClass('active');
                        $(this).next().stop(true,true).slideUp('normal');
                    }
                });

            });
        </script>
        <!--//menu-->
        <!--seller-->
        <div class="product-bottom">
            <h3 class="cate">Best Sellers</h3>
            <div class="product-go">
                <div class=" fashion-grid">
                    <a href="../Shop/ProductInfo.jsp"><img class="img-responsive " src="../images/pr.jpg" alt=""></a>
                </div>
                <div class=" fashion-grid1">
                    <h6 class="best2"><a href="../Shop/ProductInfo.jsp" >Lorem ipsum dolor sitamet consectetuer  </a></h6>
                    <span class=" price-in1"> $40.00</span>
                </div>
                <div class="clearfix"> </div>
            </div>
            <div class="product-go">
                <div class=" fashion-grid">
                    <a href="../Shop/ProductInfo.jsp"><img class="img-responsive " src="../images/pr1.jpg" alt=""></a>
                </div>
                <div class=" fashion-grid1">
                    <h6 class="best2"><a href="../Shop/ProductInfo.jsp" >Lorem ipsum dolor sitamet consectetuer  </a></h6>
                    <span class=" price-in1"> $40.00</span>
                </div>
                <div class="clearfix"> </div>
            </div>
            <div class="product-go">
                <div class=" fashion-grid">
                    <a href="../Shop/ProductInfo.jsp"><img class="img-responsive " src="../images/pr2.jpg" alt=""></a>
                </div>
                <div class=" fashion-grid1">
                    <h6 class="best2"><a href="../Shop/ProductInfo.jsp" >Lorem ipsum dolor sitamet consectetuer  </a></h6>
                    <span class=" price-in1"> $40.00</span>
                </div>
                <div class="clearfix"> </div>
            </div>
            <div class="product-go">
                <div class=" fashion-grid">
                    <a href="../Shop/ProductInfo.jsp"><img class="img-responsive " src="../images/pr3.jpg" alt=""></a>
                </div>
                <div class=" fashion-grid1">
                    <h6 class="best2"><a href="../Shop/ProductInfo.jsp" >Lorem ipsum dolor sitamet consectetuer  </a></h6>
                    <span class=" price-in1"> $40.00</span>
                </div>
                <div class="clearfix"> </div>
            </div>
        </div>

        <!--//seller-->
        <!--tag-->
        <div class="tag">
            <h3 class="cate">Tags</h3>
            <div class="tags">
                <ul>
                    <li><a href="#">design</a></li>
                    <li><a href="#">fashion</a></li>
                    <li><a href="#">lorem</a></li>
                    <li><a href="#">dress</a></li>
                    <li><a href="#">fashion</a></li>
                    <li><a href="#">dress</a></li>
                    <li><a href="#">design</a></li>
                    <li><a href="#">dress</a></li>
                    <li><a href="#">design</a></li>
                    <li><a href="#">fashion</a></li>
                    <li><a href="#">lorem</a></li>
                    <li><a href="#">dress</a></li>
                    <div class="clearfix"> </div>
                </ul>
            </div>
        </div>
    </div>

    <div class="clearfix"> </div>

    <!--footer-->
    <div class="footer">
        <div class="container">
            <div class="footer-top">
                <div class="col-md-4 top-footer1">
                    <h2>Newsletter</h2>
                    <form>
                        <input type="text" value="" onfocus="this.value='';" onblur="if (this.value == '') {this.value ='';}">
                        <input type="submit" value="SUBSCRIBE">
                    </form>
                </div>
                <div class="clearfix"> </div>
            </div>
        </div>

    </div>

</div>

<!-- 模态框（Modal） -->
<div class="modal fade" id="add2cart" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel"></h4>
            </div>
            <div class="modal-body">
                <%
                    if (session.getAttribute("user")==null||session.getAttribute("user").toString().equals("")){
                        %>
                    <div>
                        <p>Please login</p>
                    </div>
                <%
                    }else {

                        %>
                <div>
                    <p>Product is added to cart</p>
                </div>
                <%
                    }
                %>
            </div>

        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<script src="../js/jquery-3.2.1.min.js" type="text/javascript"></script>
<script src="../js/bootstrap.min.js" type="text/javascript"></script>
<script src="../js/bootstrapValidator.min.js" type="text/javascript"></script>
<script src="../js/jstarbox.js" type="text/javascript"></script>
<script src="../js/jquery.magnific-popup.js" type="text/javascript"></script>
<script src="../js/classie.js" type="text/javascript"></script>
<script src="../js/imagezoom.js" type="text/javascript"></script>
<script src="../js/jquery.chocolat.js" type="text/javascript"></script>
<script src="../js/swiper.min.js" type="text/javascript"></script>
<script src="../js/simpleCart.min.js" type="text/javascript"></script>
<script src="../js/uisearch.js" type="text/javascript"></script>
<script src="../js/modernizr.custom.72111.js" type="text/javascript"></script>
<script src="../js/memenu.js" type="text/javascript"></script>
<script>
    var viewSwiper = new Swiper('.view .swiper-container', {
        onSlideChangeStart: function() {
            updateNavPosition();
        }
    })

    $('.view .arrow-left,.preview .arrow-left').on('click', function(e) {
        e.preventDefault();
        if(viewSwiper.activeIndex == 0) {
            viewSwiper.swipeTo(viewSwiper.slides.length - 1, 1000);
            return;
        }
        viewSwiper.swipePrev();
    })
    $('.view .arrow-right,.preview .arrow-right').on('click', function(e) {
        e.preventDefault();
        if(viewSwiper.activeIndex == viewSwiper.slides.length - 1) {
            viewSwiper.swipeTo(0, 1000);
            return
        }
        viewSwiper.swipeNext();
    })

    var previewSwiper = new Swiper('.preview .swiper-container', {
        visibilityFullFit: true,
        slidesPerView: 'auto',
        onlyExternal: true,
        onSlideClick: function() {
            viewSwiper.swipeTo(previewSwiper.clickedSlideIndex);
        }
    })

    function updateNavPosition() {
        $('.preview .active-nav').removeClass('active-nav');
        var activeNav = $('.preview .swiper-slide').eq(viewSwiper.activeIndex).addClass('active-nav');
        if(!activeNav.hasClass('swiper-slide-visible')) {
            if(activeNav.index() > previewSwiper.activeIndex) {
                var thumbsPerNav = Math.floor(previewSwiper.width / activeNav.width()) - 1;
                previewSwiper.swipeTo(activeNav.index() - thumbsPerNav);
            } else {
                previewSwiper.swipeTo(activeNav.index());
            }
        }
    }
</script>

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

                Email: {
                    validators: {
                        notEmpty: {
                            message: 'Mail can not be empty.'
                        },
                        emailAddress: {
                            message: 'Please enter the correct e-mail address:123@qq.com.'
                        }
                    }
                },
                UName: {
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
                Pwd: {
                    validators: {
                        notEmpty: {
                            message: 'Password can not be blank'
                        },
                        stringLength: {
                            /*长度提示*/
                            min: 6,
                            max: 20,
                            message: 'The password must be 6-20 in length'
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
                            min: 6,
                            max: 20,
                            message: 'The password must be 6-20 in length.'
                        },
                        identical: {//相同
                            field: 'Pwd',
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

</body>
</html>