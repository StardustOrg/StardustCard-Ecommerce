package controller.client;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.artist.Artist;
import model.artist.ArtistDAO;
import model.user.User;

/**
 *
 * @author Yanna
 */
public class ClientHomeServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(true);
        User user = (User) session.getAttribute("stardust_user");
        if (user != null && user.isAdmin() == false) {
            request.setAttribute("user", user);
        } else {
            request.setAttribute("user", null);
        }
        ArtistDAO artistDAO = new ArtistDAO();

        List<Artist> artistsList = new ArrayList();
        try {
            artistsList = artistDAO.getSoloArtistsAndGroups();
        } catch (Exception ex) {
        }
        request.setAttribute("artistsList", artistsList);

        RequestDispatcher dispatcher = request.getRequestDispatcher("/client/home.jsp");
        dispatcher.forward(request, response);
    }
}
