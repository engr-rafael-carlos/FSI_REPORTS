package fsi.classes;

//import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;

/**
 * Created by agile_server on 7/22/2015.
 */

public class Variables {
    private static Variables var;
    private String login_username;
    private String login_password;
    private String account_type;
    private String company_id;
    private String inspector_id;
    private Vector<ArrayList<String>> list_of_cinspector;
    private Vector<ArrayList<String>> list_of_building;
    private Vector<ArrayList<String>> list_of_cbuilding;
    private List list_of_inspector;
    //private String inspector_dataset;
    private String inspector_name;

    public static Variables getInstance(){
        if (var == null) {
            var = new Variables();
        }
        return var;
    }

    public static void deleteInstance() {
        var = null;
    }

    public String getLogin_username(){
       return this.login_username;
    }

    public String getLogin_password() {
        return this.login_password;
    }

    public String getAccount_type() {
        return this.account_type;
    }

    public String getCompany_id() {
        return this.company_id;
    }

    public String getInspector_id() {
        return this.inspector_id;
    }

    public String getInspector_name() {
        return this.inspector_name;
    }

    public Vector<ArrayList<String>> getList_of_cinspector() {
        return this.list_of_cinspector;
    }
    public List getList_of_inspector() {
        return this.list_of_inspector;
    }

//    public String getInspector_dataset() {
//        return this.inspector_dataset;
//    }

    public Vector<ArrayList<String>> getList_of_building() {
        return this.list_of_building;
    }

    public Vector<ArrayList<String>> getList_of_cbuilding() {
        return this.list_of_cbuilding;
    }

    public void setLogin_username(String login_username){
       this.login_username =  login_username;
    }

    public void setLogin_password(String login_password) {
        this.login_password = login_password;
    }

    public void setAccount_type(String account_type) {
        this.account_type = account_type;
    }

    public void setCompany_id(String company_id) {
        this.company_id = company_id;
    }

    public void setInspector_id(String inspector_id) {
        this.inspector_id = inspector_id;
    }

    public void setInspector_name(String inspector_name) {
        this.inspector_name = inspector_name;
    }

    public void setList_of_cinspector(Vector<ArrayList<String>> list_of_cinspector) {
        this.list_of_cinspector = list_of_cinspector;
    }
    
    public void setList_of_inspector(List list_of_inspector) {
        this.list_of_inspector = list_of_inspector;
    }

    public void setList_of_building(Vector<ArrayList<String>> list_of_building) {
        this.list_of_building = list_of_building;
    }

    public void setList_of_cbuilding(Vector<ArrayList<String>> list_of_cbuilding) {
        this.list_of_cbuilding = list_of_cbuilding;
    }

    //    public void setInspector_dataset(String inspector_dataset) {
//        this.inspector_dataset = inspector_dataset;
//    }
}
