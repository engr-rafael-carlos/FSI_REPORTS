package fsi.classes;

import java.sql.*;

/**
 * Created by agile_server on 7/17/2015.
 */
public class DBConnection {
    public static Connection startConnection() {
        Connection conn = null;

        /* MYSQL Database Configuration */
        String url = "jdbc:mysql://localhost:3306/";
        String dbName = "fsi";
        String driver = "com.mysql.jdbc.Driver";
        String userName = "root";
        String password = "adminuser";

        try { /* Connecting */
            Class.forName(driver).newInstance();
            conn = DriverManager.getConnection(url + dbName, userName, password);
        } catch (Exception e) {
            /* Error in Connection */
            System.out.println("Error in starting connection");
        }
        return conn;
    }

    public static Boolean stopConnection(Connection conn, PreparedStatement pst,
            ResultSet rs) {

        Boolean status = false;

        /* Closing Connection */
        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        /* Closing PreparedStatement*/
        if (pst != null) {
            try {
                pst.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        /* Closing ResultSet */
        if (rs != null) {
            try {
                rs.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return status;
    }

}
