package Servlets;

import DAO.JoinDAO;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.Locale;

public class JoinServlet extends javax.servlet.http.HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        RequestDispatcher rd = req.getRequestDispatcher("/join/join.jsp");
        rd.include(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String login = req.getParameter("login");
        String email = req.getParameter("email");
        String pass = req.getParameter("pass");
        System.out.println(req.getParameter("avatar"));

        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");

        try {
            JoinDAO.addNewUser(login, pass, email);
            Cookie cookie = new Cookie("login", login);
            resp.addCookie(cookie);
            resp.sendRedirect("profile");
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            String error = e.toString();
            if (error.contains("users_email_uindex")) {
                req.setAttribute("error", "email");
            }
            else {
                req.setAttribute("error", "login");
            }
            RequestDispatcher rd = req.getRequestDispatcher("/join/join.jsp");
            rd.include(req, resp);
        }

    }
}
