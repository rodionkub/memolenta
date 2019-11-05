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

public class LoginServlet extends javax.servlet.http.HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        RequestDispatcher rd = req.getRequestDispatcher("/login/login.jsp");
        rd.include(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String login = req.getParameter("login");
        String pass = req.getParameter("pass");

        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");

        try {
            if (MainOfDB.correctPassword(login, pass)) {
                resp.setContentType("text/html");
                PrintWriter writer = resp.getWriter();
                writer.print("Привет, " + login + "! Рады тебя видеть :)");
            }
            else {
                RequestDispatcher rd = req.getRequestDispatcher("/login/login.jsp");
                req.setAttribute("error", "incorrect data");
                rd.include(req, resp);
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }

    }
}