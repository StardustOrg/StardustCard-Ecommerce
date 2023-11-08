/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
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

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession(true);
        User user = (User) session.getAttribute("stardust_user");
        if (user != null && user.isAdmin() == false) {
            request.setAttribute("user", user);
        } else {
            request.setAttribute("user", null);
        }
        long artistId = Long.parseLong(request.getParameter("artistId"));
        List<Artist> idols;
        ArtistDAO artistDAO = new ArtistDAO();

        Artist artist = artistDAO.getOne(artistId);

        idols = artistDAO.getAllIdols(artistId);
        if (idols.isEmpty()) {
            request.setAttribute("group", false);
        } else {
            request.setAttribute("group", true);
            request.setAttribute("idols", idols);
        }

        request.setAttribute("artistInfo", artist);

        RequestDispatcher dispatcher = request.getRequestDispatcher("/client/artist_page.jsp");
        dispatcher.forward(request, response);
    }

}
