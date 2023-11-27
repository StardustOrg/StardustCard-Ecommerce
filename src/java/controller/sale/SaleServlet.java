/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.sale;

import java.io.IOException;
import java.sql.Timestamp;
import java.time.Instant;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.product.Product;
import model.product.ProductDAO;
import model.sale.Sale;
import model.sale.SaleDAO;
import model.shoppingcart.ShoppingCart;
import model.user.User;

/**
 *
 * @author Yanna
 */
public class SaleServlet extends HttpServlet {

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(true);
        User user = (User) session.getAttribute("stardust_user");
        ShoppingCart cart = ShoppingCart.getOrCreateCart(request);
        request.setAttribute("totalCart", cart.getTotalItems());

        if (user != null && user.isAdmin() == false) {
            request.setAttribute("user", user);

            if (cart.getTotalItems() == 0) {
                String alertMessage = "Empty Cart. Please add a item before closing.";
                String redirectScript = "<script>alert('" + alertMessage + "');  window.location.href = 'Home';</script>";
                response.getWriter().write(redirectScript);
            } else {
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

                Sale mySale = new Sale(Timestamp.from(Instant.now()), user.getId());
                mySale.setProduct(products);

                SaleDAO saleDAO = new SaleDAO();
                try {
                    boolean success = saleDAO.insert(mySale);
                    if (success) {
                        cart.clearCart();
                        cart.saveCartInCookie(response);
                        response.sendRedirect("Home");
                    } else {
                        String alertMessage = "Empty Cart. Please add a item before closing.";
                        String redirectScript = "<script>alert('" + alertMessage + "');  window.location.href = 'Home';</script>";
                        response.getWriter().write(redirectScript);
                    }
                } catch (Exception ex) {
                    response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Don't have access");
                }
            }
        } else {
            response.sendError(HttpServletResponse.SC_FORBIDDEN, "Don't have access");
        }
    }
}
