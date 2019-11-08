package Servlets;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;

@WebServlet("/FileServlet")
public class FileServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String param = request.getParameter("img");
        if (param != null) {
            String filename = "/Users/rodionkub/Downloads/apache-tomcat-8.5.47/memolenta/images/" + param;
            FileInputStream in = new FileInputStream(new File(filename));
            OutputStream out = response.getOutputStream();
            response.setContentType("image/jpg");
            byte[] buf = new byte[1024];
            int count;
            while ((count = in.read(buf)) >= 0) {
                out.write(buf, 0, count);
            }
            in.close();
            out.close();
        }
        param = request.getParameter("css");
        if (param != null) {
            String filename = "/Users/rodionkub/Downloads/apache-tomcat-8.5.47/memolenta/css/" + param;
            FileInputStream in = new FileInputStream(new File(filename));
            OutputStream out = response.getOutputStream();
            byte[] buf = new byte[1024];
            int count;
            while ((count = in.read(buf)) >= 0) {
                out.write(buf, 0, count);
            }
            in.close();
            out.close();
        }
        param = request.getParameter("meme");
        if (param != null) {
            String filename = "/Users/rodionkub/Downloads/apache-tomcat-8.5.47/memolenta/memes/" + param;
            FileInputStream in = new FileInputStream(new File(filename));
            OutputStream out = response.getOutputStream();
            response.setContentType("image/jpg");
            byte[] buf = new byte[1024];
            int count;
            while ((count = in.read(buf)) >= 0) {
                out.write(buf, 0, count);
            }
            in.close();
            out.close();
        }
    }
}