<%@ page import="org.apache.ibatis.session.SqlSession" %>
<%@ page import="com.Ecom.dao.MySqlSession" %>
<%@ page import="com.Ecom.mapper.UserMapper" %>
<%@ page import="java.util.List" %>
<%@ page import="com.Ecom.model.BankCard" %>
<%@ page import="com.Ecom.model.User" %><%--
  Created by IntelliJ IDEA.
  User: ZerounZhang
  Date: 2018/3/28
  Time: 9:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Self Card</title>
    <script>
            var message="${param.Message}";
            if(message.length == 0 || null == message)
            {
                message=null;
            }
            else
            {
                alert(message);
                window.location.href="ViewSelfCard.jsp";
            }
    </script>
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
<form name="form1" method="post" action="">
    <table class="table table-hover" id="addresstable">
        <thead>
        <tr>
            <th></th>
            <th>Card Number</th>
            <th>type</th>
            <th>Card Holder</th>
            <th>Bank Name</th>
        </tr>
        </thead>
        <tbody>
        <%
            SqlSession sqlSession= MySqlSession.getMySession(response);
            UserMapper mapper = sqlSession.getMapper(UserMapper.class);

            List<BankCard> bankCardList = mapper.getLinkedCards(((User)session.getAttribute("user")).getEmail());

            for (int i=0;i<bankCardList.size();i++){
        %>
        <tr>
            <td class="tb2_td1">
                <input type = "radio" name = "check" id = "check" value="<%=bankCardList.get(i).getCard_id()%>"/>
            </td>
            <td><%=bankCardList.get(i).getCard_id()%></td>
            <td><%=bankCardList.get(i).getType()%></td>
            <td><%=bankCardList.get(i).getCard_holder()%></td>
            <td><%=bankCardList.get(i).getBank_name()%></td>.
        </tr>
        <%
            }
        %>
        </tbody>
    </table>
    <br/><br/>
    <div style="float: right">
        <a href="AddSelfCard.jsp" class="btn">
            <span class="glyphicon glyphicon-plus btn btn-info" >Card</span>
        </a>
        <a id="delete" class="btn btn-danger" onclick="confirmDelete()"><span class="glyphicon glyphicon-trash" ></span>Delete</a>
    </div>
</form>
</body>

<script>
    $("tr").bind("click",function(){
        $("input:radio").attr("checked",false);
        $(this).find("td").find("input:radio").attr("checked",true);
    });
</script>

<script>
    function callDelete() {
        var check=document.getElementsByName("check");
        var flag=false;
        for(var c=0;c<check.length;c++)
        {
            if(check[c].checked==true)
            {
                flag=true;
                document.form1.action='/deleteSelectedCard/'+check[c].value;
                document.form1.submit();
            }
        }
        if(flag==false)
            alert("Please select a card!");
    }

    function confirmDelete()
    {
        if(confirm('Are you sure to delete the seleted card?'))
        {
            callDelete();
            return true;
        }
        else
            return false;
    }
</script>


</html>
