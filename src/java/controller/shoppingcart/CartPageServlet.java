package controller.shoppingcart;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.shoppingcart.ShoppingCart;

/**
 *
 * @author Yanna
 */
public class CartPageServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ShoppingCart cart = ShoppingCart.getOrCreateCart(request);
        request.setAttribute("totalCart", cart.getTotalItems());

        if (cart.getTotalItems() == 0) {
            request.setAttribute("empty", true);
        } else {
            request.setAttribute("empty", true);
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher("/client/cart_page.jsp");
        dispatcher.forward(request, response);
    }
}
