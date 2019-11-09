<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%request.setCharacterEncoding("UTF-8");%>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Добавление текста</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="https://use.fontawesome.com/releases/v5.0.8/js/all.js"></script>
</head>
<body>
<link rel="stylesheet" href="FileServlet?css=createMemWithText.css">
<nav class="navbar navbar-expand-md navbar-light bg-light sticky-top">
    <div class="container-fluid">
        <a href="http://localhost:8080/main" class="navbar-brad"><img src="FileServlet?img=photo1.jpg"></a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a href="http://localhost:8080/main" class="nav-link">Главная</a>
                </li>
                <li class="nav-item active">
                    <a href="http://localhost:8080/newMeme" class="nav-link">Создать мем</a>
                </li>
                <li class="nav-item">
                    <a href="http://localhost:8080/profile" class="nav-link">Моя страница</a>
                </li>
                <li class="nav-item">
                    <a href="http://localhost:8080/logout" class="nav-link">Выход</a>
                </li>
                <li class="nav-item">
                    <a href="http://localhost:8080/aboutus" class="nav-link">О нас</a>
                </li>
            </ul>
        </div>
    </div>
</nav>
<form action="http://localhost:8080/newMeme?img=<%=request.getParameter("img")%>" method="post">
    <div class="mb-3 my-3 mx-3">
        <label for="validationTextarea">Данный текст будет располагаться наверху картинки</label>
        <input type="text" class="form-control" name="upperText" id="validationTextarea" placeholder="Введите текст">
    </div>
    <div class="mb-3 my-3 mx-3">
        <label for="validationTextarea1">Данный текст будет располагаться внизу картинки</label>
        <input type="text" class="form-control" name="lowerText" id="validationTextarea1" placeholder="Введите текст">
    </div>
    <button type="submit" class="btn btn-primary background white my-sm-5 mx-3">Создать</button>
</form>
</body>
</html>