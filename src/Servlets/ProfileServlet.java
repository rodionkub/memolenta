package Servlets;

import DAO.ProfileDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Arrays;
import java.util.HashMap;


@WebServlet("/ProfileServlet")
public class ProfileServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");

        boolean logged = false;
        String login = null;
        for (Cookie ck : req.getCookies()) {
            if (ck.getName().equals("login")) {
                login = ck.getValue();
                logged = true;
            }
        }
        if (!logged) {
            RequestDispatcher rd = req.getRequestDispatcher("login");
            rd.include(req, resp);
            return;
        }
        HashMap<String, String> data = null;
        try {
            data = ProfileDAO.getData(login);
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
            System.out.println("sc " + subscriptions_count);
            req.setAttribute("email", data.get("email"));
            req.setAttribute("subscribers_count", data.get("subscribers_count"));
            req.setAttribute("login", login);
            req.setAttribute("posts_count", posts_count);
            req.setAttribute("subscriptions_count", subscriptions_count);
        }
        RequestDispatcher rd = req.getRequestDispatcher("/profile/profile.jsp");
        rd.include(req, resp);
    }
}
