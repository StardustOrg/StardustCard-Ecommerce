package controller.admin;

import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.product.Product;
import model.report.ReportDAO;

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
                List<Map<String, Object>> clientReport = r.getClientReport(3);
//                Gson g = new Gson();
                resp.getWriter().write(clientReport.indexOf(0));
//                downloadReportAsTxt(clientReport, resp, "SalesByClientReport.txt");
            }
//            case "2" -> {
//                // Gera relatório de produtos sem estoque
//                ReportDAO r = new ReportDAO();
//                List<Product> noStockProducts = r.getNoStockProducts();
//                downloadReportAsTxt(noStockProducts, resp, "NoStockProductsReport.txt");
//            }
//            default -> {
//            }
        }

//        resp.sendRedirect(req.getContextPath() + "/admin/reports.jsp");
    }

    private void downloadReportAsTxt(List<?> data, HttpServletResponse response, String fileName) throws IOException {
        response.setContentType("text/plain");
        response.setHeader("Content-disposition", "attachment; filename=" + fileName);

        try (PrintWriter out = response.getWriter()) {
            for (Object item : data) {
                out.println(item.toString());
            }
        }
    }
}
