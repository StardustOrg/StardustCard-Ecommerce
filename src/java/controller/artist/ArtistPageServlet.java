package controller.artist;

import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.artist.*;
import model.user.User;

/**
 *
 * @author aluno
 */
public class ArtistPageServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession(true);
        User user = (User) session.getAttribute("stardust_user");
        List<Artist> idols;
        ArtistDAO artistDAO = new ArtistDAO();
        if (user != null && user.isAdmin() == false) {
            request.setAttribute("user", user);
        } else {
            request.setAttribute("user", null);
        }
        String[] pathInfo = request.getPathInfo().split("/");

        switch (pathInfo.length) {
            case 2 -> {
                // Case: Artists/artist_slug
                String artistSlug = pathInfo[1];
                Artist artist = artistDAO.getBySlug(artistSlug);
                if (artist != null && artist.getCover() != null) {
                    request.setAttribute("artistInfo", artist);
                    idols = artistDAO.getAllIdols(artist.getId());
                    if (idols.isEmpty()) {
                        request.setAttribute("group", false);
                    } else {
                        request.setAttribute("group", true);
                        request.setAttribute("idols", idols);
                    }
                } else {
                    // Handle artist not found, e.g., show an error page
                    response.sendError(HttpServletResponse.SC_NOT_FOUND, "Artist not found");
                    return;
                }
            }
            case 3 -> {
                // Case: Artists/group_slug/member_slug
                String groupSlug = pathInfo[1];
                String memberSlug = pathInfo[2];
                Artist group = artistDAO.getBySlug(groupSlug);
                Artist member = artistDAO.getGroupMemberBySlug(group.getId(), memberSlug);
                if (member != null && member.getCover() != null) {
                    request.setAttribute("artistInfo", member);
                    request.setAttribute("group", false);
                } else {
                    response.sendError(HttpServletResponse.SC_NOT_FOUND, "Group or member not found");
                    return;
                }
            }
            default -> {
                // Invalid URL format, handle accordingly (e.g., show an error page)
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Invalid URL format");
                return;
            }
        }

        // Common code for all cases...
        RequestDispatcher dispatcher = request.getRequestDispatcher("/client/artist_page.jsp");
        dispatcher.forward(request, response);
    }
}
