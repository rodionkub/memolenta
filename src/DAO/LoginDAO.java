package DAO;

import Database.MainOfDB;

import java.sql.ResultSet;
import java.sql.SQLException;

public class LoginDAO {
    private static MainOfDB db = new MainOfDB();
    public static boolean correctPassword(String login, String pass) throws SQLException, ClassNotFoundException {
        ResultSet rs = db.accessDB().executeQuery("select * from users where " +
                "(login='" + login + "' or email='" + login + "') and password='" + pass + "';");
        int size = 0;
        while (rs.next()) {
            size++;
        }
        return size > 0;
    }
}
