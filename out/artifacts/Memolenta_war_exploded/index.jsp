<%--
  Created by IntelliJ IDEA.
  User: rodionkub
  Date: 17/10/2019
  Time: 11:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%request.setCharacterEncoding("UTF-8");%>
<html>
<head>
    <title>$Title$</title>
</head>
<body>
    <% RequestDispatcher rd = request.getRequestDispatcher("main");
    rd.include(request, response); %>
</body>
</html>
