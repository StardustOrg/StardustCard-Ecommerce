package controller.shoppingcart;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import java.io.IOException;
import java.lang.reflect.Type;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.shoppingcart.ShoppingCart;

/**
 *
 * @author Yanna
 */
public class UpdateQuantityServlet extends HttpServlet {

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws IOException {
        // Retrieve data from the request
        int productId = Integer.parseInt(request.getParameter("productId"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        // Get or create the shopping cart
        ShoppingCart cart = ShoppingCart.getOrCreateCart(request);

        // Update the quantity in the shopping cart
        cart.updateQuantity(productId, quantity);

        // Save the updated cart in the cookie
        cart.saveCartInCookie(response);

        response.sendRedirect("Cart");
    }
}
