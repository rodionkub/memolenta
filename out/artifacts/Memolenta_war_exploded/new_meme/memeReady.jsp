<%@ page import="java.time.LocalDateTime" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="DAO.MemeDAO" %>
<%@ page import="java.sql.SQLException" %>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%request.setCharacterEncoding("UTF-8");%>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Готовый мем</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="https://use.fontawesome.com/releases/v5.0.8/js/all.js"></script>
</head>
<body>
<link rel="stylesheet" href="FileServlet?css=memReady.css">
<nav class="navbar navbar-expand-md navbar-light bg-light sticky-top">
    <div class="container-fluid">
        <a href="#" class="navbar-brad"><img src="FileServlet?img=photo1.jpg" alt="hey dog"></a>
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
<div class="card text-center mx-auto my-sm-4" style="width: 700px">
    <div class="card-header text-dark">
        Ваш готовый мемес
    </div>
    <img src="FileServlet?meme=<%=request.getAttribute("meme")%>" class="card-img-top" alt="...">
    <div class="card-body">
        <button type="submit" class="btn btn-primary background white mx-3">Скачать</button>
    </div>
</div>
<h1 class="display-4"></h1>
</body>
</html>