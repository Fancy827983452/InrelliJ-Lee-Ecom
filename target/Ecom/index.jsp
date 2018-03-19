<html>
<head>
    <script type="text/javascript">
        var message="${param.Message}";
        if(message.length == 0 || null == message)
        {
            message=null;
        }
        else
        {
            alert(message);
            window.location.href="index.jsp";
        }
    </script>
</head>
<body>
    <h2>Index</h2>

    <!-- WEB-INF目录下的jsp文件只能通过controller跳转获取 -->
    <!-- 出于安全性考虑，应把某些页面放入WEB-INF中，某些放在外面-->
    <% String path = request.getContextPath();
        String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path; %>
    <a href="<%=basePath %>/demo/login.jsp">Select Demo - Login</a>
    <br/><br/>
    <a href="<%=basePath %>/demo/register.jsp">Insert Demo - Register</a>
    <br/><br/>
    <a href="<%=basePath %>/demo/update.jsp">Update Demo - Update User Info</a>
    <br/><br/>
    <a href="<%=basePath %>/demo/delete.jsp">Delete Demo - Delete User</a>
    <br/><br/>
    <form id="form1" method="post" action="<%=basePath %>/show">
        <%--<input type="hidden" name="name" value="value" />--%>
        <a onclick="document.getElementById('form1').submit();" href="<%=basePath %>/show">Show Demo - Show All Records</a>
    </form>
    <br/><br/>
</body>
</html>
