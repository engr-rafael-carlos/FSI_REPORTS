package fsi.servlets;

import fsi.classes.CreateData;
import fsi.classes.Validation;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Created by agile_server on 8/22/2015.
 */
@WebServlet(name = "BuildingServlet")
public class BuildingServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        String method = request.getParameter("b_method");

        if(method.equals("Create")) {
            /* Initialization */
            String id = request.getParameter("b_create_id");
            String admin = request.getParameter("b_create_admin");
            String address = request.getParameter("b_create_address");
            String contact = request.getParameter("b_create_contact");
            String iid = request.getParameter("b_create_iid");
            String doi = request.getParameter("b_create_doi");
            String comm = request.getParameter("b_create_comm");
            String stat = request.getParameter("b_create_stat");

            boolean status = Validation.validateId("building_details", "building_id", id);
            if(status == true) {
                /* Building ID Exist */
                out.println("<script type=\"text/javascript\">alert(\"Building ID Already Exist\")</script>");
            }

            status = CreateData.createBuilding(id,admin,address,contact,doi,iid,comm,stat);
            if(status == true) {
                /* Successfully Created */
                out.println("<script type=\"text/javascript\">alert(\"Successfully Created\")</script>");
            }
            else {
                /* Failed */
                out.println("<script type=\"text/javascript\">alert(\"Create Failed\")</script>");
            }


        }
        else if(method.equals("Update")) {
            String id = request.getParameter("b_update_id");
            String admin = request.getParameter("b_update_admin");
            String address = request.getParameter("b_update_address");
            String contact = request.getParameter("b_update_contact");
            String iid = request.getParameter("b_update_iid");
            String doi = request.getParameter("b_update_doi");
            String di = request.getParameter("b_update_di");
            String comm = request.getParameter("b_update_comm");
            String stat = request.getParameter("b_update_stat");
            
            boolean status = CreateData.updateBuilding(id,admin,address,contact,iid,doi,di,comm,stat);
            if(status == true) {
                /* Successfully Updated */
                out.println("<script type=\"text/javascript\">alert(\"Successfully Updated\")</script>");
            }
            else {
                /* Failed */
                out.println("<script type=\"text/javascript\">alert(\"Update Failed\")</script>");
            }
        }
        else {
            /* No Method*/
            out.println("<script type=\"text/javascript\">alert(\"No Method\")</script>");
        }
        response.sendRedirect("list.jsp");
                
        out.close();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
