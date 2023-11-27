package controller.admin.artist;

import java.io.IOException;
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
 * @author joaov
 */
public class ArtistsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ArtistDAO artistDAO = new ArtistDAO();
        // Chama o ArtistDAO para obter a lista de artistas
        List<Artist> artists;
        artists = artistDAO.getAll();

        request.setAttribute("artists", artists);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/admin/artists.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        String method = request.getParameter("_method");
        System.out.println(method);
        if ("PUT".equals(method)) {
            doPut(request, response);
        } else {
            String artistName = request.getParameter("artist-name");
            String imageURL = request.getParameter("photocard-url");
            String coverURL = request.getParameter("cover-url");
            boolean isIdol = request.getParameter("is-idol") != null && request.getParameter("is-idol").equals("on");
            String group = request.getParameter("group-id");
            group = (group == null || group.equals("null")) ? "0" : group;
            long groupId = isIdol ? Long.parseLong(group) : 0;

            // Crie um objeto Artist com os dados
            Artist newArtist = new Artist(groupId, artistName, imageURL, coverURL, groupId);

            // Use o ArtistDAO para inserir o artista no banco de dados
            ArtistDAO artistDAO = new ArtistDAO();
            boolean insert = artistDAO.insert(newArtist);
            response.getWriter().append("msg: " + insert);
            if (insert) {
                response.sendRedirect("Artists");
            }
        }
    }

    @Override
    protected void doPut(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        long artistId = Long.parseLong(request.getParameter("artist-id"));
        String artistName = request.getParameter("editName");
        String imageURL = request.getParameter("editPhoto");
        String coverURL = request.getParameter("editCover");
        boolean isIdol = request.getParameter("editIsIdol") != null && request.getParameter("editIsIdol").equals("on");
        String group = request.getParameter("editGroupId");
        group = (group == null || group.equals("null")) ? "0" : group;
        long groupId = isIdol ? Long.parseLong(group) : 0;

        // Crie um objeto Artist com os dados
        Artist updatedArtist = new Artist(artistId, artistName, imageURL, coverURL, groupId);

        // Use o ArtistDAO para atualizar o artista no banco de dados
        ArtistDAO artistDAO = new ArtistDAO();
        boolean update = artistDAO.update(updatedArtist);

        if (update) {
            response.sendRedirect("Artists");
        } else {
            response.getWriter().append("msg: Update failed");
        }
    }
}
