<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Address</title>
    <link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="../css/bootstrapValidator.min.css" rel="stylesheet" type="text/css"/>
    <link href="../css/mystyle.css" rel="stylesheet">
    <link href="../css/cart.css" rel="stylesheet">
</head>

<body>
<div class="container">
    <jsp:include page="../Shared/_SellerManagement.jsp" />
    <ul class="breadcrumb">
        <li class="active">
            User Management
        </li>
        <li class="active">
            Address
        </li>
    </ul>

    <a role="button" data-toggle="modal" data-target="#addaddress">
        <span class="glyphicon glyphicon-plus" style="font-size: 18px;">Address</span>
    </a>

    <div class="modal fade" id="addaddress" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="myModalLabel">Add Address</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal"  id="Addressform" name="Addressform" method="post">
                        <div class="form-group row">
                            <label for="name" class="col-md-offset-2 col-md-2 control-label" >Name:</label>
                            <div class="col-md-6"><input type="text" class="form-control" id="name" name="name"></div>
                        </div>
                        <div class="form-group row">
                            <label for="address" class="col-md-offset-2 col-md-2 control-label" >Address:</label>
                            <div class="col-md-6"><input type="text" class="form-control" id="address" name="address"></div>
                        </div>
                        <div class="form-group row">
                            <label for="phone" class="col-md-offset-2 col-md-2 control-label" >Phone:</label>
                            <div class="col-md-6"><input type="text" class="form-control" id="phone" name="phone"></div>
                        </div>
                        <div class="form-group row">
                            <label for="postcode" class="col-md-offset-2 col-md-2 control-label" >Postcode:</label>
                            <div class="col-md-6"><input type="text" class="form-control" id="postcode" name="postcode"></div>
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
            <th>Consignee</th>
            <th>Address</th>
            <th>Postcode</th>
            <th>Phone</th>
            <th>Operation</th>
            <th></th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>Tanmay</td>
            <td>Bangalorefdjhfgiudhgoidlhgfikhkjdzkh,gzidgh</td>
            <td>560001</td>
            <td>374687264</td>
            <td>
                <a role="button" herf="">modify</a>&nbsp;|
                <a role="button" herf="">delete</a>
            </td>
            <td><input id="add" class="btn1" type="button" value="default address"/></td>
        </tr>
        <tr>
            <td>Sachin</td>
            <td>Mumbai</td>
            <td>400003</td>
            <td>7435634754597</td>
            <td><a role="button" herf="">modify</a>&nbsp;|
                <a role="button" herf="">delete</a>
            </td>
            <td><input id="add" class="btn1" type="button" value="Use as Default"/></td>
        </tr>
        <tr>
            <td>Uma</td>
            <td>Pune</td>
            <td>411027</td>
            <td>7435634754597</td>
            <td><a role="button" herf="">modify</a>&nbsp;|
                <a role="button" herf="">delete</a>
            </td>
            <td><input id="add" class="btn1" type="button" value="Use as Default" /></td>
        </tr>
        </tbody>
    </table>
</div>
    <script src="../js/jquery-3.2.1.min.js" type="text/javascript"></script>
    <script src="../js/bootstrap.min.js" type="text/javascript"></script>
    <script src="../js/bootstrapValidator.min.js" type="text/javascript"></script>
    <script>
        $(function () {
            $("#Addressform").bootstrapValidator({
                message:'This value is not valid',
                feedbackIcons:{
                    valid:'glyphicon glyphicon-ok',
                    invalid: 'glyphicon glyphicon-remove',
                    validating: 'glyphicon glyphicon-refresh'
                },
                fields:{
                    name:{
                        validators:{
                            notEmpty:{
                                message:'Name cannot be valid.'
                            },
                            stringLength:{
                                min:1,
                                max:10,
                                message:'Name must be between 1 and 10 characters in length.'
                            }
                        }
                    },
                    address:{
                        validators:{
                            notEmpty:{
                                message:'Address cannot be valid.'
                            }
                        }
                    },
                    phone:{
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
                                message: '请输入正确的手机号码'
                            }
                        }

                    },
                    postcode:{
                        validators:{
                            notEmpty:{
                                message:'Postcode cannot be valid.'
                            }
                        }
                    }

                }
            }),
                $("#submit").click(function(){
                    $('#Addressform').bootstrapValidator('validate');
                });
            
        });
    </script>

</body>
</html>