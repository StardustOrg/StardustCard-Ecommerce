package controller.client;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
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
        // list of artits
        ArtistDAO artistDAO = new ArtistDAO();
        
        List<Artist> artistsList = new ArrayList();
        try {
            artistsList = artistDAO.getSoloArtistsAndGroups();
        } catch (Exception ex) {
        }
        request.setAttribute("artistsList", artistsList);

        ProductDAO productDAO = new ProductDAO();

        // list of products with less than 5 units
        List<Product> lastUnits = new ArrayList();
        try {
            lastUnits = productDAO.getAllLastUnits();
        } catch (Exception ex) {
        }
        request.setAttribute("lastUnits", lastUnits);
        
        // list of recently added or modified products
        List<Product> newAdds = new ArrayList();
        try {
            newAdds = productDAO.getAllInStock();
            Collections.reverse(newAdds);
        } catch (Exception ex) {
        }
        
        // Cookies
        Cookie cookie = null;
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie c : cookies) {
                if (c.getName().equals("smdecommerce.carrinho")) {
                    cookie = c;
                    break;
                }
            }
        }
        if (cookie == null) {
            cookie = new Cookie("smdecommerce.carrinho", "");
        }
        cookie.setMaxAge(Integer.MAX_VALUE);
        response.addCookie(cookie);
        request.setAttribute("newAdds", newAdds);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/client/home.jsp");
        dispatcher.forward(request, response);
    }
}
