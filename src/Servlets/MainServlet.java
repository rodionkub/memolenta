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
}
