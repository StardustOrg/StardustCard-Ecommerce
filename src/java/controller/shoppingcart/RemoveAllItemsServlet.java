package controller.shoppingcart;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.shoppingcart.ShoppingCart;

/**
 *
 * @author Yanna
 */
public class RemoveAllItemsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int productId = Integer.parseInt(request.getParameter("productId"));
        ShoppingCart cart = ShoppingCart.getOrCreateCart(request);
        cart.removeAllItems(productId);
        cart.saveCartInCookie(response);
        if (cart.getTotalItems() == 0) {
            response.sendRedirect("Home");
        } else {
            response.sendRedirect("Cart");
        }
    }
}
