/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin.user;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.user.User;
import model.user.UserDAO;

/**
 *
 * @author joaov
 */
public class AdminUserServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(true);
        User user = (User) session.getAttribute("stardust_user");

        UserDAO userDAO = new UserDAO();
        User admin = userDAO.getOne(user.getLogin());
        int qtdAdmin = userDAO.countAdminUsers();
        request.setAttribute("admin", admin);
        request.setAttribute("qtdAdmin", qtdAdmin);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/admin/user.jsp");
        dispatcher.forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String login = request.getParameter("login");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        Long id = Long.parseLong(request.getParameter("id"));

        UserDAO userDao = new UserDAO();

        boolean update = userDao.update(new User(id, login, null, email, true, address, name));
        response.getWriter().append("msg: " + update);

        if (update) {
            response.sendRedirect("User");
        }
    }

}
