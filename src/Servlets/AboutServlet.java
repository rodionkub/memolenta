package Servlets;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class AboutServlet extends HttpServlet {
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
            RequestDispatcher rd = req.getRequestDispatcher("/aboutus/aboutus.jsp");
            rd.include(req, resp);
            return;
        }
        req.setAttribute("login", login);
        RequestDispatcher rd = req.getRequestDispatcher("/aboutus/aboutUsForUser.jsp");
        rd.include(req, resp);
    }

}
