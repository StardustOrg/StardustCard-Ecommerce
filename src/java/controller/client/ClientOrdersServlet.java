package controller.client;

import java.io.IOException;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.sale.Sale;
import model.sale.SaleDAO;
import model.shoppingcart.ShoppingCart;
import model.user.User;

/**
 *
 * @author Yanna
 */
public class ClientOrdersServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(true);
        User user = (User) session.getAttribute("stardust_user");
        
        ShoppingCart cart = ShoppingCart.getOrCreateCart(request);
        request.setAttribute("totalCart", cart.getTotalItems());
        if (user != null && user.isAdmin() == false) {
            request.setAttribute("user", user);
            
            SaleDAO saleDAO = new SaleDAO();
            List<Sale> mySales = saleDAO.getAllFromClient(user.getId());
            Collections.sort(mySales, Comparator.comparing(Sale::getDate).reversed());

            request.setAttribute("mySales", mySales);
            
            RequestDispatcher dispatcher = request.getRequestDispatcher("/client/my_orders_page.jsp");
            dispatcher.forward(request, response);
        } else {
            response.sendError(HttpServletResponse.SC_FORBIDDEN, "Don't have access");
        }
    }

}
