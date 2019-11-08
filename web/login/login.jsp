<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%request.setCharacterEncoding("UTF-8");%>
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
<link rel="stylesheet" href="FileServlet?css=login.css">
<nav class="navbar navbar-expand-md navbar-light bg-light sticky-top">
    <div class="container-fluid">
        <a href="http://localhost:8080/main" class="navbar-brad"><img src="FileServlet?img=photo1.jpg" alt="sup bitch"></a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item active">
                    <a href="http://localhost:8080/main" class="nav-link">Главная</a>
                </li>
                <li class="nav-item">
                    <a href="http://localhost:8080/newMeme" class="nav-link">Создать мем</a>
                </li>
                <li class="nav-item">
                    <a href="http://localhost:8080/join" class="nav-link">Зарегистрироваться</a>
                </li>
                <li class="nav-item">
                    <a href="http://localhost:8080/login" class="nav-link">Войти</a>
                </li>
                <li class="nav-item">
                    <a href="http://localhost:8080/aboutus" class="nav-link">О нас</a>
                </li>
            </ul>
        </div>
    </div>
</nav>
<form class="form-horizontal" action="http://localhost:8080/login" method="post">
    <div class="form-row">
        <div class="col-md-4 mb-3 mx-3 my-3">
            <label for="inputEmail3">Логин или почта</label>
            <div class="input-group">
                <input type="text" name="login" id="inputEmail3"
                       placeholder="Логин или почта" aria-describedby="inputGroupPrepend3" required value="<%
    String login = request.getParameter("login");
    if (login == null) {%>" class="form-control">
                <%
                } else {
                %><%=login%>" class="form-control is-invalid">
                <div class="invalid-feedback">
                    Некорректный логин или почта
                </div>
                <%
                    }
                %>

            </div>
        </div>
        <div class="form-group col-md-4 mb-3 mx-3 my-3">
            <label for="inputPassword3" class=" control-label">Пароль</label>
            <div class="input-group">
                <input type="password" name="pass" id="inputPassword3"
                       placeholder="Пароль" aria-describedby="inputGroupPrepend3" required value="<%
    String pass = request.getParameter("pass");
    if (pass == null) {%>" class="form-control">
                <%
                } else {
                %><%=pass%>" class="form-control is-invalid">
                <div class="invalid-feedback">
                    Некорректный пароль
                </div>
                <%
                    }
                %>
            </div>
        </div>
        <a href="password.html" class="btn btn-primary background white my-sm-5 mx-3">Забыли пароль?</a>
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
            <button type="submit" class="btn btn-primary background white">Войти</button>
        </div>
    </div>
</form>
</body>
</html>