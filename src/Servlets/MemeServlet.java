package Servlets;

import MemePackage.MemeGenerator;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.time.Instant;
import java.util.Date;

@WebServlet("/MemeServlet")
public class MemeServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");

        if (req.getParameter("img") != null) {
            RequestDispatcher rd;
            boolean flag = false;
            for (Cookie ck : req.getCookies()) {
                if (ck.getName().equals("login")) {
                    rd = req.getRequestDispatcher("/new_meme/memeTextUser.jsp");
                    rd.include(req, resp);
                    flag = true;
                    break;
                }
            }
            if (!flag) {
                rd = req.getRequestDispatcher("/new_meme/memeText.jsp");
                rd.include(req, resp);
            }
        }
        else {
            RequestDispatcher rd;
            boolean flag = false;
            for (Cookie ck : req.getCookies()) {
                if (ck.getName().equals("login")) {
                    rd = req.getRequestDispatcher("/new_meme/createMemeUser.jsp");
                    rd.include(req, resp);
                    flag = true;
                    break;
                }
            }
            if (!flag) {
                rd = req.getRequestDispatcher("/new_meme/createMeme.jsp");
                rd.include(req, resp);
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");

        String img = req.getParameter("img");
        String upperText = req.getParameter("upperText");
        String lowerText = req.getParameter("lowerText");

        try {
            String meme = MemeGenerator.generateMeme(new File("/Users/rodionkub/Downloads/apache-tomcat-8.5.47/memolenta/images/" + img), upperText, lowerText);
            req.setAttribute("meme", meme);
            RequestDispatcher rd;
            boolean flag = false;
            for (Cookie ck : req.getCookies()) {
                if (ck.getName().equals("login")) {
                    rd = req.getRequestDispatcher("/new_meme/memeReadyUser.jsp");
                    rd.include(req, resp);
                    flag = true;
                    break;
                }
            }
            if (!flag) {
                rd = req.getRequestDispatcher("/new_meme/memeReady.jsp");
                rd.include(req, resp);
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
}
