package controller.client;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.shoppingcart.ShoppingCart;
import model.user.User;
import model.user.UserDAO;

/**
 *
 * @author Yanna
 */
public class ProfileServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(true);
        User user = (User) session.getAttribute("stardust_user");
        if (user != null && user.isAdmin() == false) {
            request.setAttribute("user", user);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/client/profile_page.jsp");
            dispatcher.forward(request, response);
        } else {
            response.sendError(HttpServletResponse.SC_FORBIDDEN, "Don't have access");
        }
        
        ShoppingCart cart = ShoppingCart.getOrCreateCart(request);
        request.setAttribute("totalCart", cart.getTotalItems());
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession(true);
        User user = (User) session.getAttribute("stardust_user");
        String name = request.getParameter("name");
        String address = request.getParameter("address");
        String email = request.getParameter("email");

        UserDAO userDAO = new UserDAO();
        if (user != null && user.isAdmin() == false) {
            User updatedUser = user;
            updatedUser.setAddress(address);
            updatedUser.setEmail(email);
            updatedUser.setName(name);
            boolean result = userDAO.update(updatedUser);
            if (result) {
                session.setAttribute("stardust_user", updatedUser);
            response.sendRedirect("Profile");
            }
        } else {
            response.sendError(HttpServletResponse.SC_FORBIDDEN, "Don't have access");
        }
    }

}
