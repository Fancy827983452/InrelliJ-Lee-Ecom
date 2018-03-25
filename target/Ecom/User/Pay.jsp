<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Pay</title>
    <link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="../css/bootstrapValidator.min.css" rel="stylesheet" type="text/css"/>
    <link href="../css/mystyle.css" rel="stylesheet"/>
</head>
<body>
<div class="container">
    <jsp:include page="../Shared/_Layout.jsp"/>
    <div style="margin-top: 50px;margin-left:200px;width: 60%;height:400px;border: 1px solid #b0b0b0;">
        <div style="margin-left: 200px;margin-top:120px;">
            <font size="5" color="red">Total:</font><br>
            <font size="5">Card ID:</font>
            <select>
                <option value ="volvo">Volvo</option>
                <option value ="saab">Saab</option>
                <option value="opel">Opel</option>
                <option value="audi">Audi</option>
            </select>
            <br>
            <font size="5">Password:</font><input type="password"/><br>
            <button type="submit" class="btn btn-default" style="color: red;margin-top: 20px;">Pay</button>
        </div>
    </div>
</div>
</body>
</html>
