/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

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
public class RegisterServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("/client/register.jsp");
        dispatcher.forward(request, response);
    }
    
    /**
     * Register a User
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String login = request.getParameter("login");
        String email = request.getParameter("email");
        boolean admin = Boolean.parseBoolean(request.getParameter("admin"));
        String password = request.getParameter("password");
        String address = request.getParameter("address");
        String name = request.getParameter("name");

        User user = new User(login, password, email, admin, address, name);
        UserDAO userDAO = new UserDAO();
        boolean cadastrado = userDAO.insert(user);

        if (cadastrado) {
            response.sendRedirect("Login");
        } else {
            String alertMessage = "Registration failed. Please try again.";
            String redirectScript = "<script>alert('" + alertMessage + "'); window.location.href = 'Register';</script>";
            response.getWriter().write(redirectScript);
        }
    }
}
