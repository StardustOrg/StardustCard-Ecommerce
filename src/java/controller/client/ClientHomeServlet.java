package controller.client;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.artist.Artist;
import model.artist.ArtistDAO;

/**
 *
 * @author Yanna
 */
public class ClientHomeServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        ArtistDAO artistDAO = new ArtistDAO();

        List<Artist> artistsList = new ArrayList();
        try {
            artistsList = artistDAO.getAll();
        } catch (Exception ex) {
        }
        request.setAttribute("artistsList", artistsList);
        
        RequestDispatcher dispatcher = request.getRequestDispatcher("/client/home.jsp");
        dispatcher.forward(request, response);
    }
}
