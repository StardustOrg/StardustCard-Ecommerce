/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.artist.Artist;
import model.artist.ArtistDAO;
import model.product.Product;
import model.product.ProductDAO;
import model.user.User;

/**
 *
 * @author joaov
 */
public class PhotocardsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(true);
        User user = (User) session.getAttribute("stardust_user");
        if (user != null && user.isAdmin()) {
            ProductDAO productDAO = new ProductDAO();
            ArtistDAO artistDAO = new ArtistDAO();

            List<Artist> artists = artistDAO.getAll();
            List<Product> products = productDAO.getAll();
            request.setAttribute("artists", artists);
            request.setAttribute("photocards", products);
            System.out.print(products);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/admin/photocards.jsp");
            dispatcher.forward(request, response);
        } else {
            response.sendError(HttpServletResponse.SC_FORBIDDEN, "Don't have access");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession(true);
        User user = (User) session.getAttribute("stardust_user");

        if (user != null && user.isAdmin()) {
            try {
                String photocardName = request.getParameter("photocard-name");
                String imageURL = request.getParameter("photocard-url");
                String unitsParam = request.getParameter("photocard-units");
                String priceParam = request.getParameter("photocard-price");
                String[] selectedArtists = request.getParameterValues("artists");

                // Verificar se os parâmetros necessários não são nulos ou vazios
                if (photocardName == null || imageURL == null || unitsParam == null || priceParam == null
                        || photocardName.isEmpty() || imageURL.isEmpty() || unitsParam.isEmpty() || priceParam.isEmpty()) {
                    response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid input parameters");
                    return;
                }

                int units;
                double price;

                // Tentar converter os parâmetros units e price para os tipos corretos (int e double)
                try {
                    units = Integer.parseInt(unitsParam);
                    price = Double.parseDouble(priceParam);
                } catch (NumberFormatException e) {
                    response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid numeric input");
                    return;
                }

                // Verificar se os artistas selecionados não são nulos
                if (selectedArtists == null || selectedArtists.length == 0) {
                    response.sendError(HttpServletResponse.SC_BAD_REQUEST, "No artists selected");
                    return;
                }

                Product product = new Product();
                product.setDescription(photocardName);
                product.setPicture(imageURL);
                product.setAmount(units);
                product.setPrice(price);

                List<Long> selectedArtistsIds = new ArrayList<>();

                for (String id : selectedArtists) {
                    selectedArtistsIds.add(Long.parseLong(id));
                }

                ArtistDAO artistDAO = new ArtistDAO();
                List<Artist> artists = artistDAO.getAll();
                List<Artist> myArtists = new ArrayList<>();

                for (Artist artist : artists) {
                    if (selectedArtistsIds.contains(artist.getId())) {
                        myArtists.add(artist);
                    }
                }

                product.setArtists(myArtists);
                ProductDAO productDAO = new ProductDAO();
                boolean insert = productDAO.insert(product);

                if (insert) {
                    response.sendRedirect("Photocards");
                } else {
                    response.sendError(HttpServletResponse.SC_FORBIDDEN, "Failed to insert product");
                }
            } catch (Exception e) {
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Internal server error");
            }
        } else {
            response.sendError(HttpServletResponse.SC_FORBIDDEN, "Access forbidden");
        }
    }

}
