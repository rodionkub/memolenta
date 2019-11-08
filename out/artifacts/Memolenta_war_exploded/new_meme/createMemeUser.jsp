<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%request.setCharacterEncoding("UTF-8");%>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Создание мема</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="https://use.fontawesome.com/releases/v5.0.8/js/all.js"></script>
</head>
<body>
<link rel="stylesheet" href="FileServlet?css=createMem.css">
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
                    <a href="aboutUsForUser.html" class="nav-link">О нас</a>
                </li>
            </ul>
        </div>
    </div>
</nav>
<div class="container">
    <h1 class="h4 text-center page-header my-3"><em>Выберите шаблон</em></h1>
</div>
<hr>
<div class="container">
    <div class="row">
        <div class="col-xs-12 col-sm-6 col-md-4 col-lg-3">
            <a href="http://localhost:8080/newMeme?img=photo3.jpg">
                <img src="FileServlet?img=photo3.jpg" alt="...">
            </a>
        </div>
        <div class="col-xs-12 col-sm-6 col-md-4 col-lg-3">
            <a href="http://localhost:8080/newMeme?img=photo4.jpg">
                <img src="FileServlet?img=photo4.jpg" alt="...">
            </a>
        </div>
        <div class="col-xs-12 col-sm-6 col-md-4 col-lg-3">
            <a href="http://localhost:8080/newMeme?img=photo5.png">
                <img src="FileServlet?img=photo5.png" alt="...">
            </a>
        </div>
        <div class="col-xs-12 col-sm-6 col-md-4 col-lg-3">
            <a href="http://localhost:8080/newMeme?img=photo61.jpg">
                <img src="FileServlet?img=photo61.jpg" alt="...">
            </a>
        </div>
        <div class="col-xs-12 col-sm-6 col-md-4 col-lg-3">
            <a href="http://localhost:8080/newMeme?img=photo81.jpg">
                <img src="FileServlet?img=photo81.jpg" alt="...">
            </a>
        </div>
        <div class="col-xs-12 col-sm-6 col-md-4 col-lg-3">
            <a href="http://localhost:8080/newMeme?img=photo101.jpg">
                <img src="FileServlet?img=photo101.jpg" alt="...">
            </a>
        </div>
        <div class="col-xs-12 col-sm-6 col-md-4 col-lg-3">
            <a href="http://localhost:8080/newMeme?img=photo11.jpg">
                <img src="FileServlet?img=photo11.jpg" alt="...">
            </a>
        </div>
        <div class="col-xs-12 col-sm-6 col-md-4 col-lg-3">
            <a href="http://localhost:8080/newMeme?img=photo12.jpg">
                <img src="FileServlet?img=photo12.jpg" alt="...">
            </a>
        </div>
        <div class="col-xs-12 col-sm-6 col-md-4 col-lg-3">
            <a href="http://localhost:8080/newMeme?img=photo13.jpeg">
                <img src="FileServlet?img=photo13.jpeg" alt="...">
            </a>
        </div>
        <div class="col-xs-12 col-sm-6 col-md-4 col-lg-3">
            <a href="http://localhost:8080/newMeme?img=photo14.jpg">
                <img src="FileServlet?img=photo14.jpg" alt="...">
            </a>
        </div>
        <div class="col-xs-12 col-sm-6 col-md-4 col-lg-3">
            <a href="http://localhost:8080/newMeme?img=photo15.jpg">
                <img src="FileServlet?img=photo15.jpg" alt="...">
            </a>
        </div>
        <div class="col-xs-12 col-sm-6 col-md-4 col-lg-3">
            <a href="http://localhost:8080/newMeme?img=photo16.jpg">
                <img src="FileServlet?img=photo16.jpg" alt="...">
            </a>
        </div>
    </div>
</div>

<script src="/examples/vendors/jquery/jquery-3.3.1.min.js"></script>
<script src="/examples/vendors/bootstrap-3.3.7/js/bootstrap.min.js"></script>

<script>
    // После загрузки DOM-дерева (страницы)
    $(function() {
        //при нажатии на ссылку, содержащую Thumbnail
        $('a.thumbnail').click(function(e) {
            //отменить стандартное действие браузера
            e.preventDefault();
            //присвоить атрибуту scr элемента img модального окна
            //значение атрибута scr изображения, которое обёрнуто
            //вокруг элемента a, на который нажал пользователь
            $('#image-modal .modal-body img').attr('src', $(this).find('img').attr('src'));
            //открыть модальное окно
            $("#image-modal").modal('show');
        });
        //при нажатию на изображение внутри модального окна
        //закрыть его (модальное окно)
        $('#image-modal .modal-body img').on('click', function() {
            $("#image-modal").modal('hide')
        });
    });
</script>
</body>
</html>