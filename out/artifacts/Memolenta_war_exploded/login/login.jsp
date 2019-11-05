<%--
  Created by IntelliJ IDEA.
  User: rodionkub
  Date: 05/11/2019
  Time: 03:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Вход</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="https://use.fontawesome.com/releases/v5.0.8/js/all.js"></script>
</head>
<body>
<link rel="stylesheet" href="login.css">
<nav class="navbar navbar-expand-md navbar-light bg-light sticky-top">
    <div class="container-fluid">
        <a href="#" class="navbar-brad"><img src="img/photo1.jpg"></a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a href="main.html" class="nav-link">Главная</a>
                </li>
                <li class="nav-item">
                    <a href="/join/join.jsp" class="nav-link">Зарегистрироваться</a>
                </li>
                <li class="nav-item">
                    <a href="login.jsp" class="nav-link active">Войти</a>
                </li>
                <li class="nav-item">
                    <a href="aboutus.html" class="nav-link">О нас</a>
                </li>
                <li class="nav-item">
                    <a href="#5" class="nav-link">Выйти</a>
                </li>
            </ul>
        </div>
    </div>
</nav>
<form class="form-horizontal" action="http://localhost:8080/login" method="post">

    <div class="form-group">
        <div class="coll-sm-10" style="margin-left: 15px; margin-top: 10px">
            <%if (request.getAttribute("error") != null) {%>Неверно введен логин или пароль. Повторите снова.<%}
            else {%>Введите свои данные<%}%>
        </div>
    </div>

    <div class="form-group">
        <label for="inputEmail3" class="col-sm-2 control-label">Email или логин</label>
        <div class="col-sm-10">
            <input type="text" name="login" required class="form-control" id="inputEmail3"
                   placeholder="Введите email или логин"
                   value="<%
    String login = request.getParameter("login");
    if (login == null) {%><%}
    else {
        %><%=login%><%
    }
    %>">
        </div>
    </div>
    <div class="form-group">
        <label for="inputPassword3" class="col-sm-2 control-label">Пароль</label>
        <div class="col-sm-10">
            <input type="password" name="pass" required class="form-control" id="inputPassword3"
                   placeholder="Введите пароль"
                   value="<%
    String pass = request.getParameter("pass");
    if (pass == null) {%><%}
    else {
        %><%=pass%><%
    }
    %>">
        </div>
    </div>
    <div class="form-group">
        <div class="col-sm-offset-2 col-sm-10">
            <div class="checkbox">
                <label>
                    <input type="checkbox"> Запомнить меня
                </label>
            </div>
        </div>
    </div>
    <div class="form-group">
        <div class="col-sm-offset-2 col-sm-10">
            <button type="submit" class="btn btn-default">Войти</button>
        </div>
    </div>
</form>
</body>
</html>
