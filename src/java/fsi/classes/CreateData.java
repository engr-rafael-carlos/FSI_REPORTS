package fsi.classes;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 * Created by agile_server on 8/12/2015.
 */
public class CreateData {
    public static boolean createInspector(String inspector_id, String
            inspector_name, String inspector_address, String inspector_contact,
            String inspector_email, String inspector_password){
        /* Initialization */
        boolean status = false;
        Connection conn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        Variables var = Variables.getInstance();

        /* Encrypting Password */
        String encrypted_password = HashPassword.encrypt_to_salt(HashPassword.encrypt_to_sha(inspector_password));

        try {
            /* Start Database Connection */
            conn = DBConnection.startConnection();
            
            /* Setting Query for Login Details */
            pst = conn.prepareStatement("insert into login_details (email," +
                    "password, account_type, company_id, inspector_id) VALUES (?,?,?,?,?);");
            pst.setString(1, inspector_email);
            pst.setString(2, encrypted_password);
            pst.setString(3, "inspector");
            pst.setString(4, var.getCompany_id());
            pst.setString(4, inspector_id);
            String login_details = "insert into login_details (email,password," +
                    " account_type, company_id, inspector_id) VALUES ('" + inspector_email +
                    "','" + encrypted_password + "','inspector','" + var.getCompany_id() +
                    "','" + inspector_id + "');";

            /* Executing Query for Login Detail */
            pst.executeUpdate(login_details);

            /* Setting Query for Inspector Details */
            pst = conn.prepareStatement("insert into inspector_details (" +
                    "inspector_id, company_id, inspector_name, " +
                    "inspector_address, inspector_contact, " +
                    "inspector_email) VALUES (?,?,?,?,?,?);");
            pst.setString(1,inspector_id);
            pst.setString(2,var.getCompany_id());
            pst.setString(3,inspector_name);
            pst.setString(4,inspector_address);
            pst.setString(5,inspector_contact);
            pst.setString(6,inspector_email);
            System.out.println(pst.toString());
//            String inspector_details = "insert into inspector_details (" +
//                    "inspector_id, company_id, inspector_name, " +
//                    "inspector_address, inspector_contact, " +
//                    "inspector_email) VALUES ('" + inspector_id +
//                    "','" + var.getCompany_id() + "','" + inspector_name +
//                    "','" + inspector_address + "','" + inspector_contact +
//                    "','" + inspector_email + "');";

            /* Executing Query for Inspector Detail */
            pst.executeUpdate();

            status = true;

        } catch (Exception e) {
            System.out.println(e);
        } finally {
            /* Closing of Connections */
            DBConnection.stopConnection(conn,pst,rs);
        }
        return status;
    }

    public static boolean createBuilding(String building_id, String
            building_admin, String building_address, String building_contact,
            String date_of_inspection, String inspector_id, String comment, 
            String stat){
        /* Initialization */
        boolean status = false;
        Connection conn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        Variables var = Variables.getInstance();

        try {
            /* Start Database Connection */
            conn = DBConnection.startConnection();

            /* Setting Query for Login Details */
            pst = conn.prepareStatement("insert into building_details (" +
                    "building_id, building_address, building_admin, " +
                    "building_contact, building_duration, date_of_inspection," +
                    "company_id, inspector_id, date_inspected, comment, status) VALUES (?,?,?,"
                    + "?,?,?,?,?,?,?,?);");
            pst.setString(1,building_id);
            pst.setString(2,building_address);
            pst.setString(3,building_admin);
            pst.setString(4,building_contact);
            pst.setString(5,""); // duration is empty string temporary
            pst.setString(6,date_of_inspection);
            pst.setString(7,var.getCompany_id());
            pst.setString(8,inspector_id);
            pst.setString(9,""); // date inspected
            pst.setString(10,comment);
            pst.setString(11,stat);

            /* Executing Query for Login Detail */
            pst.executeUpdate();

            status = true;

        } catch (Exception e) {
            System.out.println(e);
        } finally {
            /* Closing of Connections */
            DBConnection.stopConnection(conn,pst,rs);
        }
        return status;
    }

    public static boolean updateInspector(String inspector_id, String
            inspector_name, String inspector_address, String inspector_contact/*,
                                          String inspector_username, String inspector_password*/){
        /* Initialization */
        boolean status = false;
        Connection conn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        Variables var = Variables.getInstance();

        /* Encrypting Password */
//        String encrypted_password = HashPassword.encrypt_to_salt(HashPassword.encrypt_to_sha(inspector_password));

        try {
            /* Start Database Connection */
            conn = DBConnection.startConnection();

            /* Setting Query for Login Details */
            pst = conn.prepareStatement("UPDATE inspector_details SET inspector_name=?, inspector_address=?," +
                    "inspector_contact=? WHERE inspector_id=? AND company_id=?");
            pst.setString(1,inspector_name);
            pst.setString(2,inspector_address);
            pst.setString(3,inspector_contact);
            pst.setString(4,inspector_id);
            pst.setString(5,var.getCompany_id());

            /* Executing Query for Inspector Detail */
            pst.executeUpdate();

            status = true;

        } catch (Exception e) {
            System.out.println(e);
        } finally {
            /* Closing of Connections */
            DBConnection.stopConnection(conn,pst,rs);
        }
        return status;
    }
    
    public static boolean updateBuilding(String id, String
            admin, String address, String contact, String iid,
            String doi, String di, String comm, String stat){
        /* Initialization */
        boolean status = false;
        Connection conn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        Variables var = Variables.getInstance();

        /* Encrypting Password */
//        String encrypted_password = HashPassword.encrypt_to_salt(HashPassword.encrypt_to_sha(inspector_password));

        try {
            /* Start Database Connection */
            conn = DBConnection.startConnection();

            /* Setting Query for Login Details */
            pst = conn.prepareStatement("UPDATE building_details SET building_admin=?," +
                    "building_address=?, building_contact=?, inspector_id=?, " +
                    "date_of_inspection=?, date_inspected=?, comment=?, status=?" +
                    "WHERE building_id=? AND company_id=?");
            pst.setString(1,admin);
            pst.setString(2,address);
            pst.setString(3,contact);
            pst.setString(4,iid);
            pst.setString(5,doi);
            pst.setString(6,di);
            pst.setString(7,comm);
            pst.setString(8,stat);
            pst.setString(9,id);
            pst.setString(10,var.getCompany_id());
            
            /* Executing Query for Inspector Detail */
            pst.executeUpdate();

            status = true;

        } catch (Exception e) {
            System.out.println(e);
        } finally {
            /* Closing of Connections */
            DBConnection.stopConnection(conn,pst,rs);
        }
        return status;
    }
}
