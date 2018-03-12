
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored ="false" %>
<html>
<head>
    <title>Login Result</title>

    <script type="text/javascript">
        var message="${LoginMessage}";
        if(null==message  || message.length==0)
        {
            message=null;
        }
        else
        {
            alert(message);
        }
    </script>
</head>
<body>
Welcome, ${param.email}!
<br/><br/>
Email:${User.email}<br/>
Name: ${User.name}<br/>
Password: ${User.password}<br/>
Role: ${User.role}<br/>
Actual Name: ${User.actual_name}<br/>
Phone: ${User.phone}<br/>
Gender: ${User.gender}<br/>
Status: ${User.status}<br/>
</body>
</html>