package fsi.servlets;

import fsi.classes.CreateData;
import fsi.classes.Validation;
import fsi.classes.Variables;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Created by agile_server on 8/21/2015.
 */
@WebServlet(name = "InspectorServlet")
public class InspectorServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        PrintWriter out = response.getWriter();
        String method = request.getParameter("i_method");
        
        Variables var = Variables.getInstance();
        request.setAttribute("list",var.getList_of_inspector());

        if(method.equals("Create")) {
            /* Initialization */
            String id = request.getParameter("i_create_id");
            String name = request.getParameter("i_create_name");
            String address = request.getParameter("i_create_address");
            String contact = request.getParameter("i_create_contact");
            String email = request.getParameter("i_create_email");
            String password = request.getParameter("i_password");

            boolean status = Validation.validateId("login_details","email",email);
            if(status == true) {
                /* Username Already Exist */
                out.println("<script type=\"text/javascript\">alert(\"Email Already Exist\")</script>");
            }

            status = Validation.validateId("inspector_details", "inspector_id", id);
            if (status == true) {
                /* Inspector Id Already Exist */
                out.println("<script type=\"text/javascript\">alert(\"Inspector ID Already Exist\")</script>");
            }

            /* Account is Valid */
            status = CreateData.createInspector(id,name,address,contact,email,password);
            if (status == true) {
                /* Successfully Created */
                out.println("<script type=\"text/javascript\">alert(\"Account Created\")</script>");
            }
            else {
                /* Failed to Create Account */
                out.println("<script type=\"text/javascript\">alert(\"Account Not Created\")</script>");
            }
        }
        else if(method.equals("Update")) {
            /* Initialization */
            String id = request.getParameter("i_update_id");
            String name = request.getParameter("i_update_name");
            String address = request.getParameter("i_update_address");
            String contact = request.getParameter("i_update_contact");

            boolean status = CreateData.updateInspector(id,name,address,contact);
            if(status == true) {
                /* Successfully Updated */
                out.println("<script type=\"text/javascript\">alert(\"Successfully Updated\")</script>");
            }
            else {
                /* Failed to Update */
                out.println("<script type=\"text/javascript\">alert(\"Failed to Update\")</script>");
            }
        }
        else {
            /* No Method */
            out.println("<script type=\"text/javascript\">alert(\"Failed\")</script>");
        }
        
        response.sendRedirect("list.jsp");
        
        out.close();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
