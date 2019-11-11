package Servlets;

import DAO.MemeDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/MainServlet")
public class MainServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");

        try {
            MemeDAO.getPostsArray();
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        if (req.getParameter("top") != null) {
            String setting = req.getParameter("top");
            System.out.println(setting);
        }
        RequestDispatcher rd;
        boolean flag = false;
        for (Cookie ck : req.getCookies()) {
            if (ck.getName().equals("login")) {
                rd = req.getRequestDispatcher("/main/mainForUser.jsp");
                rd.include(req, resp);
                flag = true;
                break;
            }
        }
        if (!flag) {
            rd = req.getRequestDispatcher("/main/main.jsp");
            rd.include(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");

        String login;
        String pic_link;
        try {
            if (req.getParameter("like") != null) {
                String value = req.getParameter("like");
                login = value.split(";")[0];
                pic_link = value.split(";")[1];
                MemeDAO.changeRating(true, pic_link, login);
            } else if (req.getParameter("dislike") != null) {
                String value = req.getParameter("dislike");
                login = value.split(";")[0];
                pic_link = value.split(";")[1];
                MemeDAO.changeRating(false, pic_link, login);
            }
        } catch (SQLException | ClassNotFoundException | InterruptedException e) {
            e.printStackTrace();
        }
        if (req.getParameter("redirect") != null) {
            if (req.getParameter("redirect").equals("likedMemes")) {
                resp.sendRedirect("http://localhost:8080/likedMemes");
            }
            if (req.getParameter("redirect").equals("myMemes")) {
                resp.sendRedirect("http://localhost:8080/myMemes");
            }
        }
        else {
            resp.sendRedirect("http://localhost:8080/main");
        }
    }
}
