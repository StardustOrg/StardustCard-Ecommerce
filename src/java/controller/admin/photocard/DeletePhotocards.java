/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin.photocard;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.product.ProductDAO;

/**
 *
 * @author joaov
 */
public class DeletePhotocards extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String productIdStr = req.getParameter("id");

        if (productIdStr != null && !productIdStr.isEmpty()) {
            long productId = Long.parseLong(productIdStr);
            ProductDAO productDAO = new ProductDAO();
            boolean deletionSuccess = productDAO.delete(productId);

            if (deletionSuccess) {
                resp.sendRedirect("Photocards");
            } else {
                resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error deleting Photocards.");
            }
        } else {
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid request: No Product ID provided.");
        }
    }

}
