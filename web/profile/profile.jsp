<%@ page import="java.util.ArrayList" %>
<%@ page import="DAO.MemeDAO" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.sql.SQLException" %>
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
        <a href="http://localhost:8080/main" class="navbar-brad"><img src="FileServlet?img=photo1.jpg" alt="sup bitch"></a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="navbar-nav ml-auto">
                <%if (request.getParameter("login") == null) {%>
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
                <%} else {%>
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
                <li class="nav-item">
                    <a href="http://localhost:8080/aboutus" class="nav-link">О нас</a>
                </li>
                <%}%>
            </ul>
        </div>
    </div>
</nav>
<div class="row">
    <div class="col-auto">
        <div class="row">
            <%if (request.getParameter("login") == null) {%>
            <div class="col-sm">
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
                        <!---<li class="var_nav">
                            <div class="link_bg"></div>
                            <div class="link_title">
                                <a href="http://localhost:8080/subscriptions"><span>Подписки</span></a></div>
                        </li>
                        <li class="var_nav">
                            <div class="link_bg"></div>
                            <div class="link_title">
                                <a href="http://localhost:8080/subscribers"><span>Подписчики</span></a></div>
                        </li>--->
                    </ul>
                </nav>
            </div>
            <%}%>
            <div class="col-sm">
                <div class="card bg-transparent" style="width: 14rem;">
                    <img src="FileServlet?img=<%=request.getAttribute("login") + "_ava.png"%>" class="card-img-top" alt="...">
                    <%if (request.getParameter("login") == null) {%>
                    <div class="card-body">
                        <div class="text-center">
                            <form action="http://localhost:8080/profile" method="post" enctype="multipart/form-data">
                                <input width="100px" name="avatar" type="file" class="form-control form-control-sm">
                                <button class="btn" type="submit" style="background-color: deepskyblue; height: 30px; margin-top: 5px">Применить</button>
                            </form>
                        </div>
                    </div>
                    <%}%>
                </div>
                <!---<div class="row">
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
                </div>--->
            </div>
        </div>
    </div>
    <div class="col-sm-2">
        <div class="username text-center">
            <h1><%=request.getAttribute("login")%></h1>
            <%if (request.getParameter("login") == null) {%>
            <div class="my-4">
                <h3>Почта: <%=request.getAttribute("email")%></h3>
            </div>
            <%}%>
            <h3>Посты: <%=request.getAttribute("posts_count")%></h3>
        </div>
    </div>
    <%if (request.getParameter("login") != null) {%>
        <div class="col-sm-6">
            <%
                String login = request.getParameter("login");
                try {
                    ArrayList<String> links = MemeDAO.getUserPostsArray(login);
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
    <%}%>

</div>
</body>
</html>