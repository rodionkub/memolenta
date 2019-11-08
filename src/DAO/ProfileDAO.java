package DAO;

import Database.MainOfDB;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

public class ProfileDAO {
    private static MainOfDB db = new MainOfDB();
    public static HashMap<String, String> getData(String login) throws SQLException, ClassNotFoundException {
        HashMap<String, String> data = new HashMap<>();
        ResultSet rs = db.accessDB().executeQuery("select email, cardinality(pic_links) as posts_count, subscribers_count, cardinality(subscriptions_logins) as subscriptions_count from users where login='" + login + "';");
        if (rs.next()) {
            data.put("subscriptions_count", rs.getString("subscriptions_count"));
            data.put("email", rs.getString("email"));
            data.put("subscribers_count", rs.getString("subscribers_count"));
            data.put("posts_count", rs.getString("posts_count"));
        }
        return data;
    }
}
