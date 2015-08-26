package fsi.classes;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;

/**
 * Created by agile_server on 8/10/2015.
 */
public class ListData {

    public static boolean list_cinspectors() {
        /* Initialization */
        boolean status = false;
        Connection conn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        Variables var = Variables.getInstance();
        
        List list = new ArrayList();

        try {
            /* Start Database Connection */
            conn = DBConnection.startConnection();

            /* Setting Query */
            String query = "select * from inspector_details where company_id='" + var.getCompany_id() + "';";
            pst = conn.prepareStatement(query);

            /* Executing Query */
            rs = pst.executeQuery();

            Vector<ArrayList<String>> vector = new Vector<ArrayList<String>>();

            while(rs.next()) { /* Data Exist */
                ArrayList<String> array = new ArrayList<String>();
                array.add(rs.getString("inspector_id"));
                array.add(rs.getString("inspector_email"));
                array.add(rs.getString("inspector_name"));
                array.add(rs.getString("inspector_address"));
                array.add(rs.getString("inspector_contact"));
                vector.add(array);
                
                /* test */
                list.add(rs.getString("inspector_id"));

//                System.out.println(inspector.id);
//                System.out.println(inspector.username);
//                System.out.println(inspector.name);
//                System.out.println(inspector.address);
//                System.out.println(inspector.contact);

//                System.out.println(rs.getString("inspector_id"));
//                System.out.println(rs.getString("inspector_username"));
//                System.out.println(rs.getString("inspector_name"));
//                System.out.println(rs.getString("inspector_address"));
//                System.out.println(rs.getString("inspector_contact"));
//                list.add(rs.getString("inspector_id"));
//                list.add(rs.getString("inspector_username"));
//                list.add(rs.getString("inspector_name"));
//                list.add(rs.getString("inspector_address"));
//                list.add(rs.getString("inspector_contact"));

//                var.setList_of_inspector(list);

                status = true;
            }
            var.setList_of_inspector(list);
            var.setList_of_cinspector(vector);
        } catch (Exception e) {
            System.out.println(e);
        } finally {
            /* Closing of Connections */
            DBConnection.stopConnection(conn, pst, rs);
        }
        return status;
    }

    public static boolean list_buildings() {
        /* Initialization */
        boolean status = false;
        Connection conn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        Variables var = Variables.getInstance();
        Vector<ArrayList<String>> vector = new Vector<ArrayList<String>>();
        //List list = new ArrayList();
        try {
            /* Start Database Connection */
            conn = DBConnection.startConnection();
            /* Setting Query */
            String query = "select * from building_details where company_id='" + var.getCompany_id() +
                    "' and inspector_id='"+ var.getInspector_id() +"';";
            pst = conn.prepareStatement(query);
            /* Executing Query */
            rs = pst.executeQuery();
            System.out.println(query);
            while(rs.next()) { /* Data Exist */
                ArrayList<String> array = new ArrayList();
                array.add(rs.getString("status"));
                array.add(rs.getString("building_id"));
                array.add(rs.getString("building_address"));
                array.add(rs.getString("date_of_inspection"));
                array.add(rs.getString("building_admin"));
                vector.add(array);

                status = true;
            }
            var.setList_of_building(vector);
        } catch (Exception e) {
            System.out.println(e);
        } finally {
            /* Closing of Connections */
            DBConnection.stopConnection(conn, pst, rs);
        }
        return status;
    }

    public static boolean loadInspectorDetails(String email) {
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
            String query = "select * from inspector_details where company_id='" + var.getCompany_id() +
                    "' and inspector_email='" + email +"';";
            pst = conn.prepareStatement(query);
            /* Executing Query */
            rs = pst.executeQuery();
            while(rs.next()) { /* Data Exist */
                var.setInspector_name(rs.getString("inspector_name"));
                var.setInspector_id(rs.getString("inspector_id"));
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

    public static boolean list_cbuildings() {
        /* Initialization */
        boolean status = false;
        Connection conn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        Variables var = Variables.getInstance();
        Vector<ArrayList<String>> vector = new Vector<ArrayList<String>>();
        //List list = new ArrayList();
        try {
            /* Start Database Connection */
            conn = DBConnection.startConnection();
            /* Setting Query */
            String query = "select * from building_details where company_id='" + var.getCompany_id() + "';";
            pst = conn.prepareStatement(query);
            /* Executing Query */
            rs = pst.executeQuery();

            while(rs.next()) { /* Data Exist */
                ArrayList<String> array = new ArrayList();
                array.add(rs.getString("building_id"));
                array.add(rs.getString("building_admin"));
                array.add(rs.getString("building_address"));
                array.add(rs.getString("building_contact"));
                array.add(rs.getString("inspector_id"));
                array.add(rs.getString("date_of_inspection"));
                array.add(rs.getString("date_inspected"));
                array.add(rs.getString("comment"));
                array.add(rs.getString("status"));
                vector.add(array);
                status = true;
            }
            var.setList_of_cbuilding(vector);
        } catch (Exception e) {
            System.out.println(e);
        } finally {
            /* Closing of Connections */
            DBConnection.stopConnection(conn, pst, rs);
        }
        return status;
    }
}
