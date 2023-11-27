/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin.user;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.user.UserDAO;

/**
 *
 * @author joaov
 */
public class DeleteUserServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String userId = req.getParameter("id");
        if (userId != null && !userId.isEmpty()) {
            try {
                long id = Long.parseLong(userId);

                UserDAO userDAO = new UserDAO();
                boolean deleted = userDAO.delete(id);

                if (deleted) {
                    resp.sendRedirect(req.getContextPath() + "/LogOut");
                } else {
                    resp.sendRedirect(req.getContextPath() + "/Admin/User");
                }
            } catch (NumberFormatException e) {
                resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Error in your request :)");
            }
        } else {
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Error in your request :)");
        }
    }

}
