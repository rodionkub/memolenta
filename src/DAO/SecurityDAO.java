package DAO;

import Database.MainOfDB;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;

public class SecurityDAO {
    private static MainOfDB db = new MainOfDB();

    public static HashMap<String, String> getUserEmailAndPass(String login) throws SQLException, ClassNotFoundException {
        ResultSet rs = db.accessDB().executeQuery("select email, password from users where login='" + login + "';");
        HashMap<String, String> data = new HashMap<>();
        if (rs.next()) {
            data.put("email", rs.getString("email"));
            data.put("pass", rs.getString("password"));
        }
        return data;
    }

    public static void updateEmailAndPassword(String login, String email, String pass) throws SQLException, ClassNotFoundException {
        db.accessDB().executeUpdate("update users set email = '" + email + "', password = '" + pass + "' where login = '" + login + "';");
    }
}
