package Servlets;

import DAO.ProfileDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.sql.SQLException;
import java.util.Arrays;
import java.util.HashMap;


@WebServlet("/ProfileServlet")
@MultipartConfig
public class ProfileServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");

        HashMap<String, String> data = null;

        boolean logged = false;
        String cookieLogin = null;
        String login = null;
        for (Cookie ck : req.getCookies()) {
            if (ck.getName().equals("login")) {
                cookieLogin = ck.getValue();
                logged = true;
            }
        }
        if (!logged) {
            resp.sendRedirect("http://localhost:8080/login");
            return;
        }
        try {
            data = ProfileDAO.getData(cookieLogin);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        if (data != null) {
            String posts_count = data.get("posts_count");
            if (posts_count == null) {
                posts_count = "0";
            }
            String subscriptions_count = data.get("subscriptions_count");
            if (subscriptions_count == null) {
                subscriptions_count = "0";
            }
            req.setAttribute("email", data.get("email"));
            req.setAttribute("subscribers_count", data.get("subscribers_count"));
            req.setAttribute("login", cookieLogin);
            req.setAttribute("posts_count", posts_count);
            req.setAttribute("subscriptions_count", subscriptions_count);
        }
        RequestDispatcher rd = req.getRequestDispatcher("/profile/profile.jsp");
        rd.include(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");

        String login = null;
        for (Cookie ck : req.getCookies()) {
            if (ck.getName().equals("login")) {
                login = ck.getValue();
            }
        }

        InputStream in = req.getPart("avatar").getInputStream();
        FileOutputStream out = new FileOutputStream(new File("/Users/rodionkub/Downloads/apache-tomcat-8.5.47/memolenta/images/" + login + "_ava.png"));
        byte[] buf = new byte[1024];
        int count;
        while ((count = in.read(buf)) >= 0) {
            out.write(buf, 0, count);
        }
        in.close();
        out.close();

        resp.sendRedirect("http://localhost:8080/profile");
    }
}
