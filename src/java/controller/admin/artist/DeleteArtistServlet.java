package controller.admin.artist;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.artist.ArtistDAO;
import model.user.User;

/**
 *
 * @author Yanna
 */
public class DeleteArtistServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession(true);
        User user = (User) session.getAttribute("stardust_user");
        System.out.println("controller.admin.ArtistsServlet.doDelete()");

        if (user != null && user.isAdmin()) {
            System.out.println("controller.admin.ArtistsServlet.doDelete()");
            // Recupere os dados do formulário
            long artistId = Long.parseLong(request.getParameter("artist-id"));
            System.out.println(artistId);

            // Use o ArtistDAO para excluir o artista do banco de dados
            ArtistDAO artistDAO = new ArtistDAO();
            boolean delete = artistDAO.delete(artistId);

            if (delete) {
                response.sendRedirect("Artists");
            } else {
                response.getWriter().append("msg: Delete failed");
            }
        } else {
            response.sendError(HttpServletResponse.SC_FORBIDDEN, "Don't have access");
        }
    }
}
