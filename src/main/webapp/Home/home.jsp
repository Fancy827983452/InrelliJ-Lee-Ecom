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
        <div class="col-lg-2">
            <h2>Shop Name</h2>
            <div class="list-group">
                <a href="#" class="list-group-item">Category 1</a>
                <a href="#" class="list-group-item">Category 2</a>
                <a href="#" class="list-group-item">Category 3</a>
            </div>
        </div>
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
        <div class="col-lg-2">
            <h2>Shop Name</h2>
            <div class="list-group">
                <a href="#" class="list-group-item">Category 4</a>
                <a href="#" class="list-group-item">Category 5</a>
                <a href="#" class="list-group-item">Category 6</a>
            </div>
        </div>
    </div>


    <!-- /.row -->
    <div class="content-mid">
        <h3>Trending Items</h3>
        <label class="line"></label>
        <div class="mid-popular">
            <div class="col-md-3 item-grid simpleCart_shelfItem">
                <div class=" mid-pop">
                    <div class="pro-img">
                        <img src="../images/pc.jpg" class="img-responsive" alt="">
                        <div class="zoom-icon ">
                            <a class="picture" href="../images/pc.jpg" rel="title" class="b-link-stripe b-animate-go  thickbox"><i class="glyphicon glyphicon-search icon "></i></a>
                            <a href="single.html"><i class="glyphicon glyphicon-menu-right icon"></i></a>
                        </div>
                    </div>
                    <div class="mid-1">
                        <div class="women">
                            <div class="women-top">
                                <span>Women</span>
                                <h6><a href="single.html">Sed ut perspiciati</a></h6>
                            </div>
                            <div class="img item_add">
                                <a href="#"><img src="../images/ca.png" alt=""></a>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                        <div class="mid-2">
                            <p ><label>$100.00</label><em class="item_price">$70.00</em></p>
                            <div class="block">
                                <div class="starbox small ghosting"> </div>
                            </div>

                            <div class="clearfix"></div>
                        </div>

                    </div>
                </div>
            </div>
            <div class="col-md-3 item-grid simpleCart_shelfItem">
                <div class=" mid-pop">
                    <div class="pro-img">
                        <img src="../images/pc1.jpg" class="img-responsive" alt="">
                        <div class="zoom-icon ">
                            <a class="picture" href="../images/pc1.jpg" rel="title" class="b-link-stripe b-animate-go  thickbox"><i class="glyphicon glyphicon-search icon "></i></a>
                            <a href="single.html"><i class="glyphicon glyphicon-menu-right icon"></i></a>
                        </div>
                    </div>
                    <div class="mid-1">
                        <div class="women">
                            <div class="women-top">
                                <span>Women</span>
                                <h6><a href="../Shop/ProductInfo.jsp">At vero eos</a></h6>
                            </div>
                            <div class="img item_add">
                                <a href="#"><img src="../images/ca.png" alt=""></a>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                        <div class="mid-2">
                            <p ><label>$100.00</label><em class="item_price">$70.00</em></p>
                            <div class="block">
                                <div class="starbox small ghosting"> </div>
                            </div>

                            <div class="clearfix"></div>
                        </div>

                    </div>
                </div>
            </div>
            <div class="col-md-3 item-grid simpleCart_shelfItem">
                <div class=" mid-pop">
                    <div class="pro-img">
                        <img src="../images/pc2.jpg" class="img-responsive" alt="">
                        <div class="zoom-icon ">
                            <a class="picture" href="../images/pc2.jpg" rel="title" class="b-link-stripe b-animate-go  thickbox"><i class="glyphicon glyphicon-search icon "></i></a>
                            <a href="single.html"><i class="glyphicon glyphicon-menu-right icon"></i></a>
                        </div>
                    </div>
                    <div class="mid-1">
                        <div class="women">
                            <div class="women-top">
                                <span>Men</span>
                                <h6><a href="single.html">Sed ut perspiciati</a></h6>
                            </div>
                            <div class="img item_add">
                                <a href="#"><img src="../images/ca.png" alt=""></a>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                        <div class="mid-2">
                            <p ><label>$100.00</label><em class="item_price">$70.00</em></p>
                            <div class="block">
                                <div class="starbox small ghosting"> </div>
                            </div>

                            <div class="clearfix"></div>
                        </div>

                    </div>
                </div>
            </div>
            <div class="col-md-3 item-grid simpleCart_shelfItem">
                <div class=" mid-pop">
                    <div class="pro-img">
                        <img src="../images/pc3.jpg" class="img-responsive" alt="">
                        <div class="zoom-icon ">
                            <a class="picture" href="../images/pc3.jpg" rel="title" class="b-link-stripe b-animate-go  thickbox"><i class="glyphicon glyphicon-search icon "></i></a>
                            <a href="single.html"><i class="glyphicon glyphicon-menu-right icon"></i></a>
                        </div>
                    </div>
                    <div class="mid-1">
                        <div class="women">
                            <div class="women-top">
                                <span>Women</span>
                                <h6><a href="single.html">On the other</a></h6>
                            </div>
                            <div class="img item_add">
                                <a href="#"><img src="../images/ca.png" alt=""></a>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                        <div class="mid-2">
                            <p ><label>$100.00</label><em class="item_price">$70.00</em></p>
                            <div class="block">
                                <div class="starbox small ghosting"> </div>
                            </div>

                            <div class="clearfix"></div>
                        </div>

                    </div>
                </div>
            </div>
            <div class="clearfix"></div>
        </div>
        <div class="mid-popular">
            <div class="col-md-3 item-grid simpleCart_shelfItem">
                <div class=" mid-pop">
                    <div class="pro-img">
                        <img src="../images/pc4.jpg" class="img-responsive" alt="">
                        <div class="zoom-icon ">
                            <a class="picture" href="../images/pc4.jpg" rel="title" class="b-link-stripe b-animate-go  thickbox"><i class="glyphicon glyphicon-search icon "></i></a>
                            <a href="single.html"><i class="glyphicon glyphicon-menu-right icon"></i></a>
                        </div>
                    </div>
                    <div class="mid-1">
                        <div class="women">
                            <div class="women-top">
                                <span>Men</span>
                                <h6><a href="single.html">On the other</a></h6>
                            </div>
                            <div class="img item_add">
                                <a href="#"><img src="../images/ca.png" alt=""></a>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                        <div class="mid-2">
                            <p ><label>$100.00</label><em class="item_price">$70.00</em></p>
                            <div class="block">
                                <div class="starbox small ghosting"> </div>
                            </div>

                            <div class="clearfix"></div>
                        </div>

                    </div>
                </div>
            </div>
            <div class="col-md-3 item-grid simpleCart_shelfItem">
                <div class=" mid-pop">
                    <div class="pro-img">
                        <img src="../images/pc5.jpg" class="img-responsive" alt="">
                        <div class="zoom-icon ">
                            <a class="picture" href="../images/pc5.jpg" rel="title" class="b-link-stripe b-animate-go  thickbox"><i class="glyphicon glyphicon-search icon "></i></a>
                            <a href="single.html"><i class="glyphicon glyphicon-menu-right icon"></i></a>
                        </div>
                    </div>
                    <div class="mid-1">
                        <div class="women">
                            <div class="women-top">
                                <span>Men</span>
                                <h6><a href="single.html">Sed ut perspiciati</a></h6>
                            </div>
                            <div class="img item_add">
                                <a href="#"><img src="../images/ca.png" alt=""></a>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                        <div class="mid-2">
                            <p ><label>$100.00</label><em class="item_price">$70.00</em></p>
                            <div class="block">
                                <div class="starbox small ghosting"> </div>
                            </div>

                            <div class="clearfix"></div>
                        </div>

                    </div>
                </div>
            </div>
            <div class="col-md-3 item-grid simpleCart_shelfItem">
                <div class=" mid-pop">
                    <div class="pro-img">
                        <img src="../images/pc6.jpg" class="img-responsive" alt="">
                        <div class="zoom-icon ">
                            <a class="picture" href="../images/pc6.jpg" rel="title" class="b-link-stripe b-animate-go  thickbox"><i class="glyphicon glyphicon-search icon "></i></a>
                            <a href="single.html"><i class="glyphicon glyphicon-menu-right icon"></i></a>
                        </div>
                    </div>
                    <div class="mid-1">
                        <div class="women">
                            <div class="women-top">
                                <span>Women</span>
                                <h6><a href="single.html">At vero eos</a></h6>
                            </div>
                            <div class="img item_add">
                                <a href="#"><img src="../images/ca.png" alt=""></a>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                        <div class="mid-2">
                            <p ><label>$100.00</label><em class="item_price">$70.00</em></p>
                            <div class="block">
                                <div class="starbox small ghosting"> </div>
                            </div>

                            <div class="clearfix"></div>
                        </div>

                    </div>
                </div>
            </div>
            <div class="col-md-3 item-grid simpleCart_shelfItem">
                <div class=" mid-pop">
                    <div class="pro-img">
                        <img src="../images/pc7.jpg" class="img-responsive" alt="">
                        <div class="zoom-icon ">
                            <a class="picture" href="../images/pc7.jpg" rel="title" class="b-link-stripe b-animate-go  thickbox"><i class="glyphicon glyphicon-search icon "></i></a>
                            <a href="single.html"><i class="glyphicon glyphicon-menu-right icon"></i></a>
                        </div>
                    </div>
                    <div class="mid-1">
                        <div class="women">
                            <div class="women-top">
                                <span>Men</span>
                                <h6><a href="single.html">Sed ut perspiciati</a></h6>
                            </div>
                            <div class="img item_add">
                                <a href="#"><img src="../images/ca.png" alt=""></a>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                        <div class="mid-2">
                            <p ><label>$100.00</label><em class="item_price">$70.00</em></p>
                            <div class="block">
                                <div class="starbox small ghosting"> </div>
                            </div>

                            <div class="clearfix"></div>
                        </div>

                    </div>
                </div>
            </div>
            <div class="clearfix"></div>
        </div>
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

</body>
</html>
