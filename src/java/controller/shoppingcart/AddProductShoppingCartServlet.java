package controller.shoppingcart;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import java.io.IOException;
import java.lang.reflect.Type;
import java.net.URLEncoder;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.shoppingcart.ShoppingCart;

/**
 *
 * @author Yanna
 */
public class AddProductShoppingCartServlet extends HttpServlet {

    private static final Type CART_TYPE = new TypeToken<ShoppingCart>() {}.getType();
    private static final Gson gson = new Gson();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ShoppingCart cart = ShoppingCart.getOrCreateCart(request);
        int productId = Integer.parseInt(request.getParameter("productId"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        System.out.println(quantity);
        cart.addItem(productId, quantity);
        cart.saveCartInCookie(response);
        response.sendRedirect("Home");
    }
}