package controller.product;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.product.Product;
import model.product.ProductDAO;

/**
 *
 * @author Yanna
 */
public class ProductPageServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        long id = Long.parseLong(request.getParameter("productId"));
        ProductDAO productDAO = new ProductDAO();
        Product product;
        try {
            product = productDAO.getOne(id);
            System.out.println(product.getId());
            request.setAttribute("product", product);
        } catch (Exception ex) {
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Something Happened");
        }
        
        // list of recently added or modified products
        List<Product> newAdds = new ArrayList();
        try {
            newAdds = productDAO.getAllInStock(id);
            Collections.reverse(newAdds);
        } catch (Exception ex) {
        }
        request.setAttribute("newAdds", newAdds);

        RequestDispatcher dispatcher = request.getRequestDispatcher("/client/product_page.jsp");
        dispatcher.forward(request, response);
    }
}