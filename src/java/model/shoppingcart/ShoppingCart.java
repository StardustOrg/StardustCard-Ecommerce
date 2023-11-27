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
        if (items.containsKey(productId)) {
            int existingQuantity = items.get(productId);
            items.put(productId, existingQuantity + quantity);
        } else {
            items.put(productId, quantity);
        }
        totalItems += quantity;
    }

    public void removeItem(int productId, int quantity) {
        if (items.containsKey(productId)) {
            int existingQuantity = items.get(productId);
            if (existingQuantity <= quantity) {
                items.remove(productId);
                totalItems -= existingQuantity;
            } else {
                items.put(productId, existingQuantity - quantity);
                totalItems -= quantity;
            }
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