package Servlets;

import Database.MainOfDB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
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
        String sex = req.getParameter("sex");

        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");

        try {
            MainOfDB.addNewUser(login, pass, email, sex);
            resp.setContentType("text/html");
            resp.setLocale(new Locale("ru"));
            PrintWriter writer = resp.getWriter();
            writer.print("Thanks for the registration, " + login + "!\n\nPlease, don't forget to confirm your email.");
        } catch (SQLException | ClassNotFoundException e) {
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