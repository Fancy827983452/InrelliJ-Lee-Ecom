<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored ="false" %>
<html>
<head>
    <title>Select Demo - Login</title>
</head>
<body>
    <% String path = request.getContextPath();
        String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path; %>
    <form method="post" action="<%=basePath %>/login">
        Email:<input type="text" name="email"/>
        <br/>
        Password:<input type="password" name="password"/>
        <br/>
        <input type="submit" value="submit"/>
    </form>
</body>

</html>
