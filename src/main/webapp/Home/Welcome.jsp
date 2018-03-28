<%@ page import="com.Ecom.model.Product" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Home</title>

    <%
        //        Object List=request.getParameter("productListAll");
        Object List=session.getAttribute("productListAll");
        //获取所有在售商品
        List<Product> productList = (List<Product>)List;
    %>

    <script type="text/javascript">
        if((<%=productList%>)==null)//首次加载
        {
            window.location.href = "/ShowProducts";
        }
        else
        {
            window.location.href = "home.jsp";
        }
    </script>

</head>
<body>

</body>
</html>
