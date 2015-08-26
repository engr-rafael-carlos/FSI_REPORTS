package fsi.classes;

import java.sql.*;
/**
 * Created by agile_server on 7/17/2015.
 */
public class Validation {
    /* Validate Login Credentials*/
    public static boolean validate_account(String email, String password, String purpose) {
        /* Initialization */
        boolean status = false;
        Connection conn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;

        String userpass = HashPassword.encrypt_to_sha(password);

        try {
            /* Start Database Connection */
            conn = DBConnection.startConnection();

            /* Setting Query */
            pst = conn.prepareStatement("select * from login_details where email=?;");
            pst.setString(1, email);

            /* Executing Query */
            rs = pst.executeQuery();

            /* Check password if valid */
            if (rs.next()) {
                String dbpass = HashPassword.decrypt_salt(rs.getString("password"));
                if(dbpass.equals(userpass)) {
                    if(purpose.equals("login")) { /* Validation of Login */
                        Variables var = Variables.getInstance();
                        var.setCompany_id(rs.getString("company_id"));
                        var.setAccount_type(rs.getString("account_type"));
                    }
                    else {
                        /* Password Check for Old Password */
                        /* Do Nothing */
                    }
                    status = true;
                }
            } else {
                /* Do Nothing */
            }

        } catch (Exception e) {
            System.out.println(e);
        } finally {
            /* Closing of Connections */
            DBConnection.stopConnection(conn, pst, rs);
        }

        return status;
    }

    /* Validates if Data Exists or Not */
    public static boolean validateId(String table, String column, String id){
        /* Initialization */
        boolean status = false;
        Connection conn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;

        try {
            /* Start Database Connection */
            conn = DBConnection.startConnection();

            /* Setting Query */
            String query = "select * from " + table + " where " + column + "='" + id + "';";
            pst = conn.prepareStatement(query);

            /* Executing Query */
            rs = pst.executeQuery();

            if (rs.next()) { /* Data Exist */
                status = true;
            }
            else {
                /* Do Nothing */
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