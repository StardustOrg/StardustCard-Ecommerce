package controller.access;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.user.User;
import model.user.UserDAO;

/**
 *
 * @author Yanna
 */
public class LoginServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("/client/login.jsp");
        dispatcher.forward(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String login = request.getParameter("login");
        String password = request.getParameter("password");
        
        UserDAO userDAO = new UserDAO();
        boolean success = userDAO.validateAccess(login, password);
        response.setContentType("text/html;charset=UTF-8");
        if (success) {
            User myUser = userDAO.getOne(login);

            String alertMessage;
            
            if (myUser.isAdmin()) {
                alertMessage = "Hello, Admin! Here are your credentials: "
                        + "login: " + myUser.getLogin()
                        + "; name: " + myUser.getName()
                        + "; email: " + myUser.getEmail()
                        + "; address: " + myUser.getAddress();
            } else {
                alertMessage = "Hello, Client! Here are your credentials: "
                        + "login: " + myUser.getLogin()
                        + "; name: " + myUser.getName()
                        + "; email: " + myUser.getEmail()
                        + "; address: " + myUser.getAddress();
            }
            
            String redirectScript = "<script>alert('" + alertMessage + "'); window.location.href = 'Login';</script>";
            response.getWriter().write(redirectScript);
        } else {
            String alertMessage = "Login failed. Wrong Login/Password. Please try again.";
            String redirectScript = "<script>alert('" + alertMessage + "');  window.location.href = 'Login';</script>";
            response.getWriter().write(redirectScript);
        }
    }
}
