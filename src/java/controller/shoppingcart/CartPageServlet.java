package controller.shoppingcart;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.product.Product;
import model.product.ProductDAO;
import model.shoppingcart.ShoppingCart;
import model.user.User;

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
            request.setAttribute("empty", false);
            ProductDAO productDAO = new ProductDAO();
            Map<Product, Integer> products = new HashMap<>();
            Map<Integer, Integer> myItems = cart.getItems();

            for (Map.Entry<Integer, Integer> entry : myItems.entrySet()) {
                int productId = entry.getKey();
                int quantity = entry.getValue();
                Product myProduct = productDAO.getOne(productId);

                if (myProduct != null) {
                    products.put(myProduct, quantity);
                }
            }
            request.setAttribute("products", products);
        }
        HttpSession session = request.getSession(true);
        User user = (User) session.getAttribute("stardust_user");
        if (user != null && user.isAdmin() == false) {
            request.setAttribute("user", user);
        } else {
            request.setAttribute("user", null);
        }
        RequestDispatcher dispatcher = request.getRequestDispatcher("/client/cart_page.jsp");
        dispatcher.forward(request, response);
    }
}
