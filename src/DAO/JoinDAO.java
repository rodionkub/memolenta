package DAO;

import Database.MainOfDB;

import java.sql.SQLException;

public class JoinDAO {
    private static MainOfDB db = new MainOfDB();
    public static void addNewUser(String login, String pass, String email) throws SQLException, ClassNotFoundException {
        db.accessDB().executeUpdate("insert into users (login, password, email) " +
                "values " +
                "('" + login + "'," +
                " '" + pass + "'," +
                " '" + email + "');"
        );
    }
}
