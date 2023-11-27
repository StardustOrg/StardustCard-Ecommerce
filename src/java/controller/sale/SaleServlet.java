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
import model.product.ProductDAO;
import model.sale.Sale;
import model.sale.SaleDAO;

/**
 *
 * @author joaov
 */
public class SaleServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        String userId = req.getParameter("user-id");
//        String[] productsIds = req.getParameterValues("productsIds");
//        String[] productsQuantities = req.getParameterValues("productsQuantities");
//
//        /* Escolhe produto(s) */
//        ProductDAO p = new ProductDAO();
//        Product product = p.getOne(2);
//        Product product2 = p.getOne(3);
//        /* Quantidade */
//        product.setAmount(4);
//        product2.setAmount(2);
//        /* Cria a venda */
//        Sale sale = new Sale(0, LocalDateTime.MAX, 6);
//        List<Product> products = new ArrayList<>();
//        products.add(product);
//        products.add(product2);
//
//        sale.setProduct(products);
//
//        SaleDAO s = new SaleDAO();
//
//        s.insert(sale);

    }

}
