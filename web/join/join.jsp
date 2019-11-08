<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%request.setCharacterEncoding("UTF-8");%>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Регистрация</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="https://use.fontawesome.com/releases/v5.0.8/js/all.js"></script>
</head>
<body>
<link rel="stylesheet" href="FileServlet?css=join.css">
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
<form action="http://localhost:8080/join" method="post"
      oninput='pass2.setCustomValidity(pass.value !== pass2.value ? "Пароли не совпадают" : "")'>
    <div class="form-row">
        <div class="col-md-4 mb-3 mx-3 my-3">
            <label for="inputEmail3">Email</label>
            <div class="input-group">
                <input type="email" id="inputEmail3" name="email"
                       placeholder="Введите свою почту" aria-describedby="inputGroupPrepend3" required value="<%
                   String error = (String) request.getAttribute("error");
                   String email = request.getParameter("email");
                   if (email == null) {
                       email = "";
                   }
                   if (error == null || !error.equals("email"))
                    { %>
                         <%= email%>" class="form-control"><%
            } else { %>
                " class="form-control is-invalid">
                <div class="invalid-feedback">
                    Такая почта уже существует.
                </div>
                <%}%>

            </div>
        </div>
        <div class="col-md-4 mb-3 mx-3 my-3">
            <label for="validationServer01">Логин</label>
            <input type="text" id="validationServer01" placeholder="Введите ваш логин"
                   name="login" required value="<%
                   String login = request.getParameter("login");
                   if (login == null) {
                       login = "";
                   }
                   if (error == null || !error.equals("login")) {%><%= login%>" class="form-control"><%} else { %>" class="form-control is-invalid">
            <div class="invalid-feedback">
                Такой логин уже существует.
            </div>
            <%}%>
        </div>
        <div class="form-group col-md-4 mb-3 mx-3 my-3">
            <label for="inputPassword3" class=" control-label">Пароль</label>
            <div class="input-group">
                <input type="password" class="form-control" id="inputPassword3" placeholder="Введите пароль"
                       name="pass" aria-describedby="inputGroupPrepend3" required>
            </div>
        </div>
        <div class="form-group col-md-4 mb-3 mx-3 my-3">
            <label for="inputPassword3" class=" control-label">Подтвердите пароль</label>
            <div class="input-group">
                <input type="password" class="form-control" id="checkPassword3" placeholder="Введите пароль"
                       name="pass2" aria-describedby="inputGroupPrepend3" required>
            </div>
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label" for="exampleInputFile">Добавить фотографию</label>
        <input type="file" id="exampleInputFile">
    </div>
    <button type="submit" class="btn btn-primary background white my-sm-4 mx-3">Зарегистрироваться</button>
</form>
</body>
</html>