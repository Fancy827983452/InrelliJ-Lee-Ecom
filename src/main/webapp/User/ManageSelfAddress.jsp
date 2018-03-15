<%@ page import="com.Ecom.model.Address" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" scope="session"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Modify Self Address</title>
    <link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="../css/bootstrapValidator.min.css" rel="stylesheet" type="text/css"/>
    <link href="../css/mystyle.css" rel="stylesheet">
    <link href="../css/cart.css" rel="stylesheet">
    <%List<Address> addressList=(List<Address>)session.getAttribute("addressList");    %>

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
                window.location.href="ManageSelfAddress.jsp";
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
            Manage Self Address
        </li>
    </ul>

    <%--新增地址模态框--%>
    <div class="modal fade" id="addaddress" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="myModalLabel">Add Address</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" method="post" action="/AddSelfAddress" id="Addressform" name="Addressform">
                        <div class="form-group row">
                            <label for="receiver_name" class="col-md-offset-2 col-md-2 control-label" ><span style="color:red">*&nbsp;</span>Receiver Name:</label>
                            <div class="col-md-6"><input type="text" class="form-control" id="receiver_name" name="receiver_name"></div>
                        </div>
                        <div class="form-group row">
                            <label for="address" class="col-md-offset-2 col-md-2 control-label" ><span style="color:red">*&nbsp;</span>Address:</label>
                            <div class="col-md-6"><input type="text" class="form-control" id="address" name="address"></div>
                        </div>
                        <div class="form-group row">
                            <label for="phone" class="col-md-offset-2 col-md-2 control-label" ><span style="color:red">*&nbsp;</span>Phone:</label>
                            <div class="col-md-6"><input type="text" class="form-control" id="phone" name="phone"></div>
                        </div>
                        <div class="form-group row">
                            <label for="zip_code" class="col-md-offset-2 col-md-2 control-label" ><span style="color:red">*&nbsp;</span>Zip Code:</label>
                            <div class="col-md-6"><input type="text" class="form-control" id="zip_code" name="zip_code"></div>
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


    <%--表格--%>
    <form name="form1" method="post" action="">
    <table class="table table-hover" id="addresstable">
        <thead>
        <tr>
            <th></th>
            <th>Receiver Name</th>
            <th>Address</th>
            <th>Zip Code</th>
            <th>Phone</th>
            <th>Default</th>
        </tr>
        </thead>
        <tbody>

        <%
            if(!addressList.isEmpty()){
                for(int i=0;i<addressList.size();i++){//行数
                    %>
                    <tr>
                        <td class="tb2_td1">
                            <input type = "radio" name = "check" id = "check" value="<%=addressList.get(i).getAddress_id()%>"/>
                        </td>
                        <td><%=addressList.get(i).getReceiver_name()%></td>
                        <td><%=addressList.get(i).getAddress()%></td>
                        <td><%=addressList.get(i).getZip_code()%></td>
                        <td><%=addressList.get(i).getPhone()%></td>
                        <td>
                        <%
                            if(addressList.get(i).getDefault_address()!=0){
                                %>
                            <label class="btn-primary">Default</label>
                            <%}%>
                        </td>
                    <tr>
            <%
                }
            }
        %>
        </tbody>
    </table>
        <br/><br/>
        <div style="float: right">
            <a role="button" data-toggle="modal" data-target="#addaddress">
                <span class="glyphicon glyphicon-plus btn btn-info" >Address</span>
            </a>
            <button id="modify" type="submit" class="btn btn-success" onclick="callModify()"><span class="glyphicon glyphicon-edit"></span>Modify</button>
            <a id="delete" class="btn btn-danger" onclick="confirmDelete()"><span class="glyphicon glyphicon-trash" ></span>Delete</a>
            <a id="default" class="btn btn-primary" onclick="confirmSetDefault()">Set as Default</a>
        </div>
    </form>
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
                $('#Addressform').bootstrapValidator('validate');
            });

    });

    //点击行时选中单选框
    $("tr").bind("click",function(){
        $("input:radio").attr("checked",false);
        $(this).find("td").find("input:radio").attr("checked",true);
    });

    function callModify() {
        var check=document.getElementsByName("check");
        var flag=false;
        for(var c=0;c<check.length;c++)
        {
            if(check[c].checked==true)
            {
                flag=true;
                document.form1.action='/getSelectedSelfAddress';
                document.form1.submit();
            }
        }
        if(flag==false)
            alert("Please select an address!");
    }

    function callDelete() {
        var check=document.getElementsByName("check");
        var flag=false;
        for(var c=0;c<check.length;c++)
        {
            if(check[c].checked==true)
            {
                flag=true;
                document.form1.action='/deleteSelectedSelfAddress?address_id='+check[c].value;
                document.form1.submit();
            }
        }
        if(flag==false)
            alert("Please select an address!");
    }

    function callSetDefault() {
        var check=document.getElementsByName("check");
        var flag=false;
        for(var c=0;c<check.length;c++)
        {
            if(check[c].checked==true)
            {
                flag=true;
                document.form1.action='/SetDefaultSelfAddress?address_id='+check[c].value;
                document.form1.submit();
            }
        }
        if(flag==false)
            alert("Please select an address!");
    }

    function confirmDelete()
    {
        if(confirm('Are you sure to delete the seleted address?'))
        {
            callDelete();
            return true;
        }
        else
            return false;
    }

    function confirmSetDefault() {
        if(confirm('Are you sure to set the seleted address as Default address?'))
        {
            callSetDefault();
            return true;
        }
        else
            return false;
    }

</script>

</body>
</html>