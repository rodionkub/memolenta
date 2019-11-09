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

</head>
<body>
<link rel="stylesheet" href="FileServlet?css=confidentiality.css">
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
                <li class="nav-item active">
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
<div class="row">
    <div class="col-auto">
        <nav>
            <ul>
                <li class="var_nav">
                    <div class="link_bg"></div>
                    <div class="link_title">
                        <a href="http://localhost:8080/profile"><span>Профиль</span></a></div>
                </li>
                <li class="var_nav">
                    <div class="link_bg"></div>
                    <div class="link_title">
                        <a href="http://localhost:8080/myMemes"><span>Мои мемы</span></a></div>
                </li>
                <li class="var_nav">
                    <div class="link_bg"></div>
                    <div class="link_title">
                        <a href="http://localhost:8080/likedMemes"><span>Понравившиеся мемы</span></a></div>
                </li>
                <li class="var_nav">
                    <div class="link_bg"></div>
                    <div class="link_title">
                        <a href="http://localhost:8080/security"><span>Безопасность</span></a></div>
                </li>
                <li class="var_nav">
                    <div class="link_bg"></div>
                    <div class="link_title">
                        <a href="http://localhost:8080/subscriptions"><span>Подписки</span></a></div>
                </li>
                <li class="var_nav">
                    <div class="link_bg"></div>
                    <div class="link_title">
                        <a href="http://localhost:8080/subscribers"><span>Подписчики</span></a></div>
                </li>
            </ul>
        </nav>
    </div>
    <div class="col-sm">
        <div class="info text-center my-4">
            <h2<%
                if (request.getAttribute("success") != null) {
            %> style="color: green">Вы успешно изменили информацию<%
                } else {
            %>>Здесь вы можете изменить ранее введённую информацию<%
                }%></h2>
        </div>
        <form class="form-horizontal" action="http://localhost:8080/security" method="post">
            <div class="form-row">
                <input type="text" name="login" value="<%=request.getAttribute("login")%>" style="display: none">
                <div class="col-md-4 mb-3 mx-3 my-1">
                    <label for="inputEmail3">Email</label>
                    <div class="input-group">
                        <input type="email" name="email" class="form-control" id="inputEmail3" placeholder="Email"
                               value="<%=request.getAttribute("email")%>">
                    </div>
                </div>
                <div class="form-group col-md-4 mb-3 mx-3 my-1">
                    <label for="inputPassword3" class=" control-label">Пароль</label>
                    <div class="input-group">
                        <input type="password" name="pass" class="form-control" id="inputPassword3" placeholder="Пароль"
                               value="<%=request.getAttribute("pass")%>">
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <button type="submit" class="btn btn-primary background white my-3">Применить изменения</button>
                </div>
            </div>
        </form>
    </div>
</div>
</body>
</html>