package Database;

import java.sql.*;

public class MainOfDB {

    private static Statement accessDB() throws ClassNotFoundException, SQLException {
        Class.forName("org.postgresql.Driver");
        Connection conn = DriverManager.getConnection(
                "jdbc:postgresql://localhost:5432/memolenta_db",
                "rodionkub",
                "rodionkub"
        );
        return conn.createStatement();
    }

    public static void addNewUser(String login, String pass, String email, String sex) throws SQLException, ClassNotFoundException {
        accessDB().executeUpdate("insert into users (login, password, email, sex) " +
                "values " +
                "('" + login + "'," +
                " '" + pass + "'," +
                " '" + email + "'," +
                " '" + sex + "');"
        );
    }

    public static boolean correctPassword(String login, String pass) throws SQLException, ClassNotFoundException {
        ResultSet rs = accessDB().executeQuery("select * from users where " +
                "(login='" + login + "' or email='" + login + "') and password='" + pass + "';");
        int size = 0;
        while (rs.next()) {
            size++;
        }
        return size > 0;
    }
}