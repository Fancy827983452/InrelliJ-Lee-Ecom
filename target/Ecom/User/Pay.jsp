<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Pay</title>
    <link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="../css/bootstrapValidator.min.css" rel="stylesheet" type="text/css"/>
    <link href="../css/mystyle.css" rel="stylesheet"/>
    <%
        List<String> card_idList=(List<String>)session.getAttribute("card_idList");
    %>
    <script type="text/javascript">
        var message="${param.Message}";
        var total="${param.totalPrice}";
        if(message.length == 0 || null == message)
        {
            message=null;
        }
        else
        {
            alert(message);
            window.location.href="Pay.jsp?totalPrice="+total;
        }
    </script>
</head>
<body>
<div class="container">
    <jsp:include page="../Shared/_Layout.jsp"/>
    <div style="margin-top: 50px;margin-left:200px;width: 60%;height:400px;border: 1px solid #b0b0b0;">
        <div style="margin-left: 200px;margin-top:120px;">
            <form action="/ConfirmPayPassword/${param.totalPrice}" method="post">
                <font size="5" color="red">Total:￥${param.totalPrice}</font><br>
            <font size="5">Card ID:</font>
            <select name="card_id">
                <%
                    for(int i=0;i<card_idList.size();i++)
                    {
                %>
                    <option value ="<%=card_idList.get(i)%>"><%=card_idList.get(i)%></option>
                <%
                    }
                %>
            </select>
            <br>
            <font size="5">Password:</font><input type="password" name="pay_password"/><br/>
            <button type="submit" class="btn btn-default btn-primary" style="margin-top: 20px;">Pay</button>
            </form>
        </div>
    </div>
</div>
</body>
</html>
