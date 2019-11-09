<%@ page import="java.util.ArrayList" %>
<%@ page import="DAO.MemeDAO" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.util.HashMap" %>
<!doctype html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%request.setCharacterEncoding("UTF-8");%>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Мемолента</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="https://use.fontawesome.com/releases/v5.0.8/js/all.js"></script>
    <script src="libs/fullpage/jquery.easings.min.js"></script>
    <script src="libs/fullpage/scrolloverflow.min.js"></script>
    <script src="libs/fullpage/jquery.fullPage.min.js"></script>
</head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
<body>
<link rel="stylesheet" href="FileServlet?css=main.css">
<nav class="navbar navbar-expand-md navbar-light bg-light sticky-top">
    <div class="container-fluid">
        <a href="http://localhost:8080/main" class="navbar-brad"><img src="FileServlet?img=photo1.jpg"></a>
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
<div class="row">
    <div class="col-sm">
        <div class="btn-group" role="group" aria-label="Button group with nested dropdown">
            <div class="btn-group mx-4 my-2" role="group">
                <button id="btnGroupDrop1" type="button" class="btn btn-secondary dropdown-toggle background grey" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Топ
                </button>
                <div class="dropdown-menu" aria-labelledby="btnGroupDrop1">
                    <a class="dropdown-item" href="#">За день</a>
                    <a class="dropdown-item" href="#">За неделю</a>
                    <a class="dropdown-item" href="#">За месяц</a>
                    <a class="dropdown-item" href="#">За всё время</a>
                </div>
            </div>
            <div class="btn-group my-2" role="group">
                <button id="btnGroupDrop2" type="button" class="btn btn-secondary dropdown-toggle background grey" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Мемы
                </button>
                <div class="dropdown-menu" aria-labelledby="btnGroupDrop2">
                    <a class="dropdown-item" href="#">Все мемы</a>
                    <a class="dropdown-item" href="#">Мемы подписок</a>
                </div>
            </div>
        </div>
    </div>
    <div class="col-sm-6">
        <%
            try {
                ArrayList<String> links = MemeDAO.getPostsArray();
                for (String link : links) {
                    HashMap<String, String> data = MemeDAO.getPostInfo(link);
        %>
        <div class="card mb-3">
            <div class="card-header">
                <a href="http://localhost:8080/profile?login=<%=data.get("owner_login")%>" class="btn btn-link text-dark"><%=data.get("owner_login")%></a>
            </div>
            <img src="FileServlet?meme=<%=link%>" class="card-img-top" alt="...">
            <div class="card-body">
                <button type="button" class="btn btn-outline-dark">Dislike</button>
                <button type="button" class="btn btn-outline-dark" disabled><%=data.get("rating")%></button>
                <button type="button" class="btn btn-outline-dark">Like</button>
                <p class="card-text"><small class="text-muted"><%=data.get("date")%></small></p>
            </div>
        </div><%
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    %>
    </div>
    <div class="col-sm">
        <div class="d7 mx-4 my-2">
            <form>
                <input type="text" placeholder="Искать здесь...">
                <button type="submit"></button>
            </form>
        </div>
    </div>
</div>
</body>
</html>