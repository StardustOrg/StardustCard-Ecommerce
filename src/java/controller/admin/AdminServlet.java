package controller.admin;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.report.card.CardReportDAO;


/**
 *
 * @author Yanna
 */
public class AdminServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        CardReportDAO c = new CardReportDAO();
        request.setAttribute("dailyBilling",  c.dailyBilling());
        request.setAttribute("trendingPhotocard",  c.trendingPhotocard());
        request.setAttribute("trendingArtist",  c.trendingArtist());
        RequestDispatcher dispatcher = request.getRequestDispatcher("/admin/dashboard.jsp");
        dispatcher.forward(request, response);
    }
}
