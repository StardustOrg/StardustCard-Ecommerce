/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin;

import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.sale.Sale;
import model.sale.SaleDAO;

/**
 *
 * @author joaov
 */
@WebServlet(name = "SellingsServlet", urlPatterns = {"/Admin/Sellings"})
public class SellingsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        SaleDAO saleDAO = new SaleDAO();
        List<Sale> sales = saleDAO.getAll();
        
        request.setAttribute("sales", sales);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/admin/sellings.jsp");
        dispatcher.forward(request, response);
    }
}
