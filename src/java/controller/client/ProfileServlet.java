package controller.client;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.user.User;

/**
 *
 * @author Yanna
 */
public class ProfileServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(true);
        User user = (User) session.getAttribute("stardust_user");
        if (user != null && user.isAdmin() == false) {
            request.setAttribute("user", user);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/client/profile_page.jsp");
            dispatcher.forward(request, response);
        } else {
            response.sendRedirect("Login");
        }
    }
}
