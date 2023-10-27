/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.artist;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.artist.*;

/**
 *
 * @author aluno
 */
public class ArtistPageServlet extends HttpServlet {

    
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        Artist artist = (Artist) request.getAttribute("artist");
        System.out.println(artist == null);
        /*List<Artist> idols = new ArrayList<>();
        ArtistDAO artistDAO = new ArtistDAO();
        
        idols = artistDAO.getAllIdols(artist.getId());
        if (idols.isEmpty()) {
            request.setAttribute("group", false);
        } else {
            request.setAttribute("group", true);
            request.setAttribute("idols", idols);
        }
        request.setAttribute("artistInfo", artist);*/

        RequestDispatcher dispatcher = request.getRequestDispatcher("/client/artist_page.jsp");
        dispatcher.forward(request, response);
    }

}