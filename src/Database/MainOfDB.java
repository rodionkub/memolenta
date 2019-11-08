package Database;

import java.sql.*;

public class MainOfDB {
    public static Statement accessDB() throws ClassNotFoundException, SQLException {
        Class.forName("org.postgresql.Driver");
        Connection conn = DriverManager.getConnection(
                "jdbc:postgresql://localhost:5432/memolenta_db",
                "rodionkub",
                "rodionkub"
        );
        return conn.createStatement();
    }
}