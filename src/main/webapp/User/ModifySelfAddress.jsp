<%@ page import="com.Ecom.model.Address" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Modify Self Address</title>
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
            Modify Self Address
        </li>
    </ul>
    <%
        Address address1=(Address)session.getAttribute("address1");
        if(address1 != null && !"".equals(address1))
        {
    %>
        <form class="form-horizontal" method="post" action="/ModifySelfAddress?address_id=${param.address_id}" id="ModifyAddressform" name="Addressform">
            <div class="form-group row">
                <label for="receiver_name_2" class="col-md-offset-2 col-md-2 control-label" ><span style="color:red">*&nbsp;</span>Receiver Name:</label>
                <div class="col-md-6">
                    <input type="text" class="form-control" id="receiver_name_2" name="receiver_name" value="<%=address1.getReceiver_name()%>">
                </div>
            </div>
            <div class="form-group row">
                <label for="address_2" class="col-md-offset-2 col-md-2 control-label" ><span style="color:red">*&nbsp;</span>Address:</label>
                <div class="col-md-6"><input type="text" class="form-control" id="address_2" name="address" value="<%=address1.getAddress()%>"></div>
            </div>
            <div class="form-group row">
                <label for="phone_2" class="col-md-offset-2 col-md-2 control-label" ><span style="color:red">*&nbsp;</span>Phone:</label>
                <div class="col-md-6"><input type="text" class="form-control" id="phone_2" name="phone" value="<%=address1.getPhone()%>"></div>
            </div>
            <div class="form-group row">
                <label for="zip_code_2" class="col-md-offset-2 col-md-2 control-label" ><span style="color:red">*&nbsp;</span>Zip Code:</label>
                <div class="col-md-6"><input type="text" class="form-control" id="zip_code_2" name="zip_code" value="<%=address1.getZip_code()%>"></div>
            </div>
                <center><button type="submit" class="btn btn-primary">Modify</button></center>
        </form>
    <%
        }
    %>
</div>

<script>
    $(function () {
        $("#ModifyAddressform").bootstrapValidator({
            message:'This value is not valid',
            feedbackIcons:{
                valid:'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields:{
                receiver_name:{
                    validators:{
                        notEmpty:{
                            message:'Receiver Name cannot be valid.'
                        },
                        stringLength:{
                            min:1,
                            max:20,
                            message:'Receiver Name must be between 1 and 20 characters in length.'
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
                            regexp: /^1[0-9]{10}$/,
                            message: 'Please input correct phone number.'
                        }
                    }

                },
                zip_code:{
                    validators:{
                        notEmpty:{
                            message:'Zip Code cannot be valid.'
                        },
                        stringLength:{
                            min:6,
                            max:6,
                            message:'The length of the zip code should be 6 digits.'
                        }
                    }
                }

            }
        }),
            $("#submit").click(function(){
                $('#ModifyAddressform').bootstrapValidator('validate');
            });

    });
</script>
</body>
</html>
