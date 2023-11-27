/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.sale;

import java.io.IOException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.product.Product;
import model.sale.Sale;
import model.sale.SaleDAO;

/**
 *
 * @author joaov
 */
public class SaleServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");
        try {
            String userId = req.getParameter("user-id");
            String[] productsIds = req.getParameterValues("productsIds");
            String[] productsQuantities = req.getParameterValues("productsQuantities");

            List<Product> products = new ArrayList<>();
            for (int i = 0; i < productsIds.length; i++) {
                Product product = new Product();
                product.setId(Long.parseLong(productsIds[i]));
                product.setAmount(Integer.parseInt(productsQuantities[i]));
                products.add(product);
            }

            /* Cria a venda */
            Sale sale = new Sale(0, LocalDateTime.MAX, 6);
            sale.setProduct(products);
            SaleDAO s = new SaleDAO();
            boolean checkout = s.insert(sale);
            if (checkout) {
                resp.sendRedirect("Home");
            } else {
                resp.sendError(HttpServletResponse.SC_FORBIDDEN, "Failed to checkout products");
            }
        } catch (Exception e) {
            resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Internal server error");
        }
    }

}
