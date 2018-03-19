<%@ page import="com.Ecom.model.User" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
<head>
    <title>Show All</title>
</head>
<body>
    <table border="1px">
        <th>Email</th>
        <th>Name</th>
        <th>Actual Name</th>
        <th>Phone</th>
        <th>Gender</th>
        <c:if test="${UserList==null || fn:length(UserList) == 0}">
            <tr>
                <td colspan="4">No Record!</td>
            </tr>
        </c:if>
        <c:forEach items="${UserList}" var="item" varStatus="status">
            <tr >
                <td class="center"><span class="center">${item.email}</span></td>
                <td>${item.name}</td>
                <td>${item.actual_name}</td>
                <td>${item.phone}</td>
                <td>${item.gender}</td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
