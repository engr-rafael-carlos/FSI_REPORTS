package fsi.classes;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 * Created by agile_server on 8/20/2015.
 */
public class DBDateUpdater {
    static public boolean updateDate() {
        /* Initialization */
        boolean status = false;
        Connection conn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        Variables var = Variables.getInstance();

        try {
            /* Start Database Connection */
            conn = DBConnection.startConnection();

            /* Setting Query */
            String query = "select * from building_details where status!='Done';";
            pst = conn.prepareStatement(query);

            /* Executing Query */
            rs = pst.executeQuery();

            while(rs.next()) { /* Data Exist */

                status = true;
            }
        } catch (Exception e) {
            System.out.println(e);
        } finally {
            /* Closing of Connections */
            DBConnection.stopConnection(conn, pst, rs);
        }
        return status;
    }
}
