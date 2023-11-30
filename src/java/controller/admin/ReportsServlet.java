package controller.admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.product.Product;
import model.report.ReportDAO;
import model.report.SaleReport;
import model.report.card.CardReportDAO;

public class ReportsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher dispatcher = req.getRequestDispatcher("/admin/reports.jsp");
        dispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String reportId = req.getParameter("group-id");

        switch (reportId) {
            case "1" -> {
                // Gera relatório de vendas por cliente
                ReportDAO r = new ReportDAO();
                List<SaleReport> clientReport = r.getClientSalesReport();
                downloadReportAsTxt(clientReport, resp, "SalesByClientReport.txt", "Sales By Client Report");
            }
            case "2" -> {
                // Gera relatório de produtos sem estoque
                ReportDAO r = new ReportDAO();
                List<Product> noStockProducts = r.getNoStockProducts();
                downloadReportAsTxt(noStockProducts, resp, "NoStockProductsReport.txt", "No Stock Products Report");
            }
            case "3" -> {
                CardReportDAO c = new CardReportDAO();
                String data = c.dailyBilling();
                List<String> datas = new ArrayList<>();
                datas.add(data);
                downloadReportAsTxt(datas, resp, "DailyBilling.txt", "Daily Billing Today");
            }
        }

        resp.sendRedirect(req.getContextPath() + "/admin/reports.jsp");
    }

    private void downloadReportAsTxt(List<?> data, HttpServletResponse response, String fileName, String head) throws IOException {
        response.setContentType("text/plain");
        response.setHeader("Content-disposition", "attachment; filename=" + fileName);
        Date date = new Date();
        SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
        String formattedDate = dateFormat.format(date);

        try (PrintWriter out = response.getWriter()) {
            out.println(head + " - " + formattedDate);
            out.println();
            for (Object item : data) {
                out.println(item.toString());
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
