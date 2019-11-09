<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%request.setCharacterEncoding("UTF-8");%>

<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="https://use.fontawesome.com/releases/v5.0.8/js/all.js"></script>
    <style>
        .round {
            border-radius: 100px;
            border: 3px solid #b3d7ff;
        }
    </style>
</head>
<body>
<link rel="stylesheet" href="FileServlet?css=aboutus.css">
<nav class="navbar navbar-expand-md navbar-light bg-light sticky-top">
    <div class="container-fluid">
        <a href="#" class="navbar-brad"><img src="FileServlet?img=photo1.jpg"></a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
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
                <li class="nav-item active">
                    <a href="http://localhost:8080/aboutus" class="nav-link">О нас</a>
                </li>
            </ul>
        </div>
    </div>
</nav>
<div class="container-fluid">
    <div class="row jumbotron" style="background:transparent !important" >
        <div class="col-xs-12 col-sm-12 col-md-9 col-lg-9 col-xl-10">
            <p class="lead">Наш серверный разработчик Кубышкин Родион. Любит мемы и свою маму. А также преподает в онлайн школе.
            Если вы хотите хорошо сдать егэ, то вам к нему, подготовит вас на 100 баллов!</p>
        </div>
        <img src="FileServlet?img=Rodia3.jpg" alt="" class="round">
    </div>
</div>
<div class="container-fluid">
    <div class="row jumbotron" style="background:transparent !important" >
        <div class="col-xs-12 col-sm-12 col-md-9 col-lg-9 col-xl-10">
            <p class="lead">А это наш фронт-разработчик Калинина Александра. Она, конечно, не преподает в онлайн-школе, но зато может
            на гитарке сыграть. Не только на обычной ещё и на электро. Так что, ребята, вот такие у нас веселые разрабы!</p>
        </div>
        <img src="FileServlet?img=Sanya2.jpg" alt="" class="round">
    </div>
</div>
</body>
</html>