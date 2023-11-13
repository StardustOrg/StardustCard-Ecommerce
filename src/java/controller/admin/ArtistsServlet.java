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
            response.sendRedirect("../Login");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession(true);
        User user = (User) session.getAttribute("stardust_user");

        if (user != null && user.isAdmin()) {
            // Recupere os dados do formulário
            String artistName = request.getParameter("artist-name");
            String imageURL = request.getParameter("photocard-url");
            String coverURL = request.getParameter("cover-url");
            boolean isIdol = request.getParameter("is-idol") != null && request.getParameter("is-idol").equals("on");
            long groupId = isIdol ? Long.parseLong(request.getParameter("group-id")) : 0;

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
            response.sendRedirect("../Login");
        }
    }

}
