package controller.client;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.user.User;
import model.user.UserDAO;

/**
 *
 * @author Yanna
 */
public class DeleteAccountServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(true);
        User user = (User) session.getAttribute("stardust_user");
        if (user != null && user.isAdmin() == false) {

            UserDAO userDAO = new UserDAO();

            boolean delete = userDAO.delete(user.getId());
            if (delete) {
                session.invalidate();
                String alertMessage = "Account Deleted";
                String redirectScript = "<script>alert('" + alertMessage + "'); window.location.href = 'Login';</script>";
                response.getWriter().write(redirectScript);
            } else {

                response.sendRedirect("Profile");
            }
        } else {
            response.sendError(HttpServletResponse.SC_FORBIDDEN, "Don't have access");
        }
    }

}
