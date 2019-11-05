<%--
  Created by IntelliJ IDEA.
  User: rodionkub
  Date: 05/11/2019
  Time: 01:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%request.setCharacterEncoding("UTF-8");%>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="https://use.fontawesome.com/releases/v5.0.8/js/all.js"></script>
    <title>Регистрация</title>
</head>
<body>
<link rel="stylesheet" href="join.css">
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
                <li class="nav-item active">
                    <a href="join.jsp" class="nav-link">Зарегистрироваться</a>
                </li>
                <li class="nav-item">
                    <a href="/login/login.jsp" class="nav-link">Войти</a>
                </li>
                <li class="nav-item">
                    <a href="aboutus.html" class="nav-link">О нас</a>
                </li>
                <li class="nav-item">
                    <a href="#t5" class="nav-link">Выйти</a>
                </li>
            </ul>
        </div>
    </div>
</nav>
<form action="http://localhost:8080/join" method="post" oninput='pass2.setCustomValidity(pass.value !== pass2.value ? "Пароли не совпадают" : "")'>
    <div class="form-group">
        <label for="inputLogin3" class="col-sm-2 control-label">Логин</label>
        <div class="col-sm-10">
            <input type="text" class="form-control" id="inputLogin3" required placeholder="Введите ваш логин" name="login"
                   value="<%
                   String error = (String) request.getAttribute("error");
                   String login = request.getParameter("login");
                   if (login == null) {
                       login = "";
                   }
                   if (error == null || !error.equals("login")) {%><%= login%><%}
                   else { %>Такой логин уже существует.<%}%>"
            >
        </div>
    </div>
    <div class="form-group">
        <label for="inputEmail3" class="col-sm-2 control-label">Email</label>
        <div class="col-sm-10">
            <input type="email" class="form-control" id="inputEmail3" placeholder="Введите свою почту" name="email" required
                   value="<%
                   String email = request.getParameter("email");
                   if (email == null) {
                       email = "";
                   }
                   if (error == null || !error.equals("email"))
                    { %>
                         <%= email%><%
                   }
                   else { %>
                          Такая почта уже существует.
                   <%}%>">
        </div>
    </div>
    <div class="form-group">
        <label for="inputPassword3" class="col-sm-2 control-label">Пароль</label>
        <div class="col-sm-10">
            <input type="password" required class="form-control" id="inputPassword3" placeholder="Введите пароль" name="pass">
        </div>
    </div>
    <div class="form-group">
        <label for="checkPassword3" class="col-sm-2 control-label">Подтверждение пароля</label>
        <div class="col-sm-10">
            <input type="password" required class="form-control" id="checkPassword3" placeholder="Подтвердите пароль" name="pass2">
        </div>
    </div>
    <div class="radio">
        <label class="col-sm-2 control-label">
            <input type="radio" name="sex" id="optionsRadios1" value="female" checked>
            Ж
        </label>
    </div>
    <div class="radio">
        <label class="col-sm-2 control-label">
            <input type="radio" name="sex" id="optionsRadios2" value="male">
            М
        </label>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label" for="exampleInputFile">Добавить фотографию</label>
        <input type="file" id="exampleInputFile">
    </div>
    <div style="margin-top: 15px; margin-left: 15px">
        <button type="submit" class="btn btn-default ">Зарегистрироваться</button>
    </div>
</form>


</body>
</html>
