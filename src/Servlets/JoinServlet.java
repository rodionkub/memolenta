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
import java.util.regex.Matcher;
import java.util.regex.Pattern;

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
            Pattern loginPattern = Pattern.compile("[A-z\\d]*");
            Pattern passPattern = Pattern.compile("[A-z\\d-_!]*");
            Matcher loginMatcher = loginPattern.matcher(login);
            Matcher passMatcher = passPattern.matcher(pass);
            if (loginMatcher.matches() && passMatcher.matches()) {
                JoinDAO.addNewUser(login, pass, email);
                Cookie cookie = new Cookie("login", login);
                resp.addCookie(cookie);
                resp.sendRedirect("profile");
            }
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
        req.setAttribute("error", "email");
        req.setAttribute("error", "login");
        RequestDispatcher rd = req.getRequestDispatcher("/join/join.jsp");
        rd.include(req, resp);
    }
}
