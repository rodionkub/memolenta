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
<link rel="stylesheet" href="FileServlet?css=myMemes.css">
<nav class="navbar navbar-expand-md navbar-light bg-light sticky-top">
    <div class="container-fluid">
        <a href="#" class="navbar-brad"><img src="FileServlet?img=photo1.jpg" alt="sup bitch"></a>
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
                    <a href="aboutUsForUser.html" class="nav-link">О нас</a>
                </li>
            </ul>
        </div>
    </div>
</nav>
<div class="row">
    <div class="col-auto">
        <div class="row">
            <div class="col-sm">
                <nav>
                    <ul>
                        <li class="var_nav">
                            <div class="link_bg"></div>
                            <div class="link_title">
                                <a href="page.html"><span>Профиль</span></a></div>
                        </li>
                        <li class="var_nav">
                            <div class="link_bg"></div>
                            <div class="link_title">
                                <a href="myMemes.html"><span>Мои мемы</span></a></div>
                        </li>
                        <li class="var_nav">
                            <div class="link_bg"></div>
                            <div class="link_title">
                                <a href="likeMem.html"><span>Понравившиеся мемы</span></a></div>
                        </li>
                        <li class="var_nav">
                            <div class="link_bg"></div>
                            <div class="link_title">
                                <a href="сonfidentiality.html"><span>Конфиденциальность</span></a></div>
                        </li>
                        <li class="var_nav">
                            <div class="link_bg"></div>
                            <div class="link_title">
                                <a href="subscription.html"><span>Подписки</span></a></div>
                        </li>
                        <li class="var_nav">
                            <div class="link_bg"></div>
                            <div class="link_title">
                                <a href="subscriber.html"><span>Подписчики</span></a></div>
                        </li>
                    </ul>
                </nav>
            </div>
            <div class="col-sm">
                <div class="card bg-transparent" style="width: 14rem;">
                    <img src="FileServlet?img=Rodia3.jpg" class="card-img-top" alt="...">
                    <div class="card-body">
                        <div class="text-center">
                            <a href="#" class="btn btn-primary background grey">Изменить</a>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="username">
                        <div class="col-auto my-3">
                            <h5>Подписчики</h5>
                            <div class="text-center">
                                <h5><%=request.getAttribute("subscribers_count")%></h5>
                            </div>
                        </div>
                    </div>
                    <div class="username">
                        <div class="col-sm my-3">
                            <h5>Подписки</h5>
                            <div class="text-center">
                                <h5><%=request.getAttribute("subscriptions_count")%></h5>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="col-sm-6">
        <div class="username text-center">
            <h1><%=request.getAttribute("login")%></h1>
            <div class="my-4">
                <h3>Почта: <%=request.getAttribute("email")%></h3>
            </div>
            <h3>Посты: <%=request.getAttribute("posts_count")%></h3>
        </div>
        </div>
    </div>
</div>


</body>
</html>