package model.shoppingcart;

import com.google.gson.Gson;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.product.Product;
import model.product.ProductDAO;

/**
 *
 * @author Yanna
 */
public class ShoppingCart {

    private int totalItems;
    private Map<Integer, Integer> items;

    public ShoppingCart() {
        totalItems = 0;
        items = new HashMap<>();
    }

    public int getTotalItems() {
        return totalItems;
    }

    public Map<Integer, Integer> getItems() {
        return items;
    }

    public void addItem(int productId, int quantity) {
        int maxAllowed = getMaxAllowedQuantity(productId);

        if (items.containsKey(productId)) {
            int existingQuantity = items.get(productId);
            int newQuantity = existingQuantity + quantity;

            // Validate against the maximum allowed quantity
            if (newQuantity > maxAllowed) {
                newQuantity = maxAllowed;
            }

            totalItems = totalItems - existingQuantity + newQuantity;
            items.put(productId, newQuantity);
        } else {
            // Validate against the maximum allowed quantity
            if (quantity > maxAllowed) {
                quantity = maxAllowed;
            }

            totalItems += quantity;
            items.put(productId, quantity);
        }
    }

    private int getMaxAllowedQuantity(int productId) {
        ProductDAO productDAO = new ProductDAO();
        Product product = productDAO.getOne(productId);
        
        return (product.getAmount() < 5) ? 1 : 5;
    }

    public void updateQuantity(int productId, int newQuantity) {
        if (items.containsKey(productId)) {
            int currentQuantity = items.get(productId);
            totalItems = totalItems - currentQuantity + newQuantity;
            items.put(productId, newQuantity);
        }
    }

    public void removeAllItems(int productId) {
        if (items.containsKey(productId)) {
            int existingQuantity = items.get(productId);
            items.remove(productId);
            totalItems -= existingQuantity;
        }
    }

    public void clearCart() {
        items.clear();
        totalItems = 0;
    }

    public static ShoppingCart getOrCreateCart(HttpServletRequest request) throws UnsupportedEncodingException {
        // Try to get the cart from the cookies
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if ("stardust.cart".equals(cookie.getName())) {
                    String cartData = URLDecoder.decode(cookie.getValue(), "UTF-8");
                    return new Gson().fromJson(cartData, ShoppingCart.class);
                }
            }
        }

        // If no cart cookie exists, create a new cart
        return new ShoppingCart();
    }

    public void saveCartInCookie(HttpServletResponse response) throws IOException {
        String cartData = new Gson().toJson(this, ShoppingCart.class);
        String encodedCartData = URLEncoder.encode(cartData, "UTF-8");

        Cookie cartCookie = new Cookie("stardust.cart", encodedCartData);
        cartCookie.setMaxAge(Integer.MAX_VALUE);  // Use Integer.MAX_VALUE for a persistent cookie
        response.addCookie(cartCookie);
    }
}
