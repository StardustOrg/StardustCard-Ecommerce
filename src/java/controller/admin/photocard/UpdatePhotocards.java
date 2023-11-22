package controller.admin.photocard;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.artist.Artist;
import model.product.Product;
import model.product.ProductDAO;
import model.user.User;

public class UpdatePhotocards extends HttpServlet {

    private final ProductDAO productDAO = new ProductDAO();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(true);
        User user = (User) session.getAttribute("stardust_user");

        if (user != null && user.isAdmin()) {
            long id = Long.parseLong(req.getParameter("id"));
            String description = req.getParameter("photocard-name");
            String picture = req.getParameter("photocard-url");
            int amount = Integer.parseInt(req.getParameter("photocard-units"));
            double price = Double.parseDouble(req.getParameter("photocard-price"));

            String[] selectedArtistIds = req.getParameterValues("artists");
            List<Artist> selectedArtists = new ArrayList<>();
            if (selectedArtistIds != null) {
                for (String artistId : selectedArtistIds) {
                    long artistIdLong = Long.parseLong(artistId);
                    Artist artist = new Artist();
                    artist.setId(artistIdLong);
                    selectedArtists.add(artist);
                }
            }

            Product updatedProduct = new Product(id, description, amount, picture, price, selectedArtists);

            boolean updateSuccess = productDAO.update(updatedProduct);

            if (updateSuccess) {
                resp.sendRedirect("Photocards");
            } else {
                resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Bad request :(");
            }
        } else {
            resp.sendError(HttpServletResponse.SC_FORBIDDEN, "Don't have access");

        }

    }
}
