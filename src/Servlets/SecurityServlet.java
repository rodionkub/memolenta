package Servlets;

import DAO.SecurityDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;

public class SecurityServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");

        String login = null;
        boolean logged = false;
        for (Cookie ck : req.getCookies()) {
            if (ck.getName().equals("login")) {
                login = ck.getValue();
                logged = true;
            }
        }
        if (!logged) {
            resp.sendRedirect("http://localhost:8080/login");
            return;
        }
        try {
            HashMap<String, String> data = SecurityDAO.getUserEmailAndPass(login);
            req.setAttribute("email", data.get("email"));
            req.setAttribute("pass", data.get("pass"));
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        req.setAttribute("login", login);
        RequestDispatcher rd = req.getRequestDispatcher("/profile/security.jsp");
        rd.include(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");

        String login = req.getParameter("login");
        String pass = req.getParameter("pass");
        String email = req.getParameter("email");

        try {
            SecurityDAO.updateEmailAndPassword(login, email, pass);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }

        req.setAttribute("login", login);
        req.setAttribute("email", email);
        req.setAttribute("pass", pass);
        req.setAttribute("success", true);
        RequestDispatcher rd = req.getRequestDispatcher("/profile/security.jsp");
        rd.include(req, resp);
    }
}
