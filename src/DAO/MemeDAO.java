package DAO;

import Database.MainOfDB;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;

public class MemeDAO {
    private static MainOfDB db = new MainOfDB();
    public static int getMaxImgID() throws SQLException, ClassNotFoundException {
        ResultSet rs = db.accessDB().executeQuery("select max(id) as id from posts");
        rs.next();
        return rs.getInt("id");
    }

    public static void newPost(String login, String pic_link, String date) throws SQLException, ClassNotFoundException {
        db.accessDB().executeUpdate("insert into posts (owner_login, pic_link, date) values ('" + login + "', '" + pic_link +"', '" + date + "');");
        db.accessDB().executeUpdate("update users set pic_links = array_cat(pic_links, '{" + pic_link + "}') where login = '" + login + "';");
    }

    public static ArrayList<String> getPostsArray() throws SQLException, ClassNotFoundException {
        ResultSet rs = db.accessDB().executeQuery("select * from posts order by id desc;");
        ArrayList<String> links = new ArrayList<>();
        while (rs.next()) {
            boolean flag = false;
            for (String link : links) {
                if (link.equals(rs.getString("pic_link"))) {
                    flag = true;
                    break;
                }
            }
            if (!flag) {
                links.add(rs.getString("pic_link"));
            }
        }
        return links;
    }

    public static ArrayList<String> getUserPostsArray(String login) throws SQLException, ClassNotFoundException {
        ResultSet rs = db.accessDB().executeQuery("select * from posts where owner_login='" + login + "' order by id desc;");
        ArrayList<String> links = new ArrayList<>();
        while (rs.next()) {
            boolean flag = false;
            for (String link : links) {
                if (link.equals(rs.getString("pic_link"))) {
                    flag = true;
                    break;
                }
            }
            if (!flag) {
                links.add(rs.getString("pic_link"));
            }
        }
        return links;
    }

    public static ArrayList<String> getLikedPostsArray(String login) throws SQLException, ClassNotFoundException {
        ResultSet rs = db.accessDB().executeQuery("select liked_links from users where login='" + login + "' order by id desc;");
        ArrayList<String> links = new ArrayList<>();
        if (rs.next()) {
            for (String link : (String[])rs.getArray("liked_links").getArray()) {
                System.out.println(link);
                links.add(link);
            }
        }
        return links;
    }

    public static HashMap<String, String> getPostInfo(String pic_link) throws SQLException, ClassNotFoundException {
        ResultSet rs = db.accessDB().executeQuery("select * from posts where pic_link='" + pic_link +"';");
        HashMap<String, String> data = new HashMap<>();
        if (rs.next()) {
            data.put("owner_login", rs.getString("owner_login"));
            data.put("rating", rs.getString("rating"));
            data.put("date", rs.getString("date"));
        }
        return data;
    }

    public static void changeRating(boolean like, String pic_link, String login) throws SQLException, ClassNotFoundException {
        if (like) {
            db.accessDB().executeUpdate("update users set liked_links = array_cat(liked_links, '{" + pic_link +"}') where login='" + login + "';");
            db.accessDB().executeUpdate("update posts set rating = rating + 1 where pic_link = '" + pic_link + "';");
        }
        else {
            db.accessDB().executeUpdate("update posts set rating = rating - 1 where pic_link = '" + pic_link +"';");
        }
    }
}
