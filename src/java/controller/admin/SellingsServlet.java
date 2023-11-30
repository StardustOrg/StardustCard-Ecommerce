/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin;

import java.io.IOException;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.report.card.CardReportDAO;
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
        Collections.sort(sales, Comparator.comparing(Sale::getDate).reversed());
        CardReportDAO c = new CardReportDAO();
        request.setAttribute("cardSales", c.salesReport());
        request.setAttribute("sales", sales);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/admin/sellings.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String saleIdStr = req.getParameter("saleId");
        if (saleIdStr != null && !saleIdStr.isEmpty()) {
            long saleId = Long.parseLong(saleIdStr);

            SaleDAO saleDAO = new SaleDAO();
            boolean deleted = saleDAO.delete(saleId);

            if (deleted) {
                resp.sendRedirect("Sellings");
                return;
            }
        }
        resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Internal server error");
    }

}
