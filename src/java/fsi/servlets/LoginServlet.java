package fsi.servlets;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

/* Import Classes */
import fsi.classes.*;
import java.util.List;

/**
 * Created by agile_server on 7/17/2015.
 */
@WebServlet(name = "LoginServlet")
public class LoginServlet extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        PrintWriter out = response.getWriter();

        /* Get Inputs*/
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        /* Store Data */
        Variables var = Variables.getInstance();
        var.setLogin_username(username);
        var.setLogin_password(password);

        /* Checking Validation */
        boolean status;
        status = Validation.validate_account(username, password);

        if(status == true) {
            /* Login Successful */

            HttpSession session = request.getSession();
            session.setAttribute("user", username);

            String account_type = var.getAccount_type();
            session.setAttribute("type", account_type);

            if (account_type.equals("company")) { /* Company Account */
//                out.println("<script type=\"text/javascript\"> console.log('connected')</script>");
//                fsi.classes.ListData.list_inspectors();
                
                //ListData.list_inspectors();

                /* Set Data */
                //var.getList_of_inspector();
                //var.setInspector_dataset(DataEncoder.create_dataset(var.getList_of_inspector(),"inspector_data", 5));
                
                RequestDispatcher rd = request.getRequestDispatcher("list.jsp");
                rd.forward(request, response);

            } else { /* Inspector Account */
                /* Initialize Details */
                ListData.loadInspectorDetails(username);

                RequestDispatcher rd = request.getRequestDispatcher("dashboard.jsp");
                rd.forward(request, response);
            }
        }
        else {
            /* Login Failed */
            RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
            rd.include(request, response);

            out.println("<script type=\"text/javascript\" src=\"src=\"js/application.js\"> </script>");
            out.println("<script>error_message()</script>");
        }
        out.close();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws  ServletException, IOException {
        doPost(request, response);
    }
}
