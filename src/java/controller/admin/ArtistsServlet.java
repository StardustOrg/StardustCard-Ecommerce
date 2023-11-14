/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin;

import java.io.IOException;
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
 * @author joaov
 */
public class ArtistsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(true);
        User user = (User) session.getAttribute("stardust_user");
        ArtistDAO artistDAO = new ArtistDAO();

        if (user != null && user.isAdmin()) {
            // Chama o ArtistDAO para obter a lista de artistas
            List<Artist> artists;
            artists = artistDAO.getAll();

            request.setAttribute("artists", artists);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/admin/artists.jsp");
            dispatcher.forward(request, response);
        } else {
            response.sendError(HttpServletResponse.SC_FORBIDDEN, "Don't have access");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        String method = request.getParameter("_method");
        System.out.println(method);
        if ("PUT".equals(method)) {
            doPut(request, response);
        } else if ("DELETE".equals(method)) {
            doDelete(request, response);
            System.out.println("controller.admin.ArtistsServlet.doDelete()");
        } else {
            request.setCharacterEncoding("UTF-8");
            HttpSession session = request.getSession(true);
            User user = (User) session.getAttribute("stardust_user");

            if (user != null && user.isAdmin()) {
                // Recupere os dados do formulário
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
            } else {
            response.sendError(HttpServletResponse.SC_FORBIDDEN, "Don't have access");
            }
        }
    }

    @Override
    protected void doPut(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession(true);
        User user = (User) session.getAttribute("stardust_user");

        if (user != null && user.isAdmin()) {
            // Recupere os dados do formulário
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
        } else {
            response.sendError(HttpServletResponse.SC_FORBIDDEN, "Don't have access");
        }
    }

    @Override
    protected void doDelete(HttpServletRequest request, HttpServletResponse response)
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
