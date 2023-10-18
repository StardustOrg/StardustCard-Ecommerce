package controller.access;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.user.User;
import model.user.UserDAO;

/**
 *
 * @author Yanna
 */
public class LoginServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        RequestDispatcher dispatcher = request.getRequestDispatcher("/client/login.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String login = request.getParameter("login");
        String password = request.getParameter("password");

        UserDAO userDAO = new UserDAO();
        boolean success = userDAO.validateAccess(login, password);
        response.setContentType("text/html;charset=UTF-8");
        if (success) {
            User myUser = userDAO.getOne(login);    
            /**
             * Cria uma sessão de usuário com Login, Nome se o usuário é Admin
             */
            HttpSession session = request.getSession();
            session.setAttribute("login", myUser.getLogin());
            session.setAttribute("name", myUser.getName());
            session.setAttribute("isAdmin", myUser.isAdmin());

            if (myUser.isAdmin()) {
                response.sendRedirect("Admin");
            } else {
                response.sendRedirect("Home");
            }
        } else {
            String alertMessage = "Login failed. Wrong Login/Password. Please try again.";
            String redirectScript = "<script>alert('" + alertMessage + "');  window.location.href = 'Login';</script>";
            response.getWriter().write(redirectScript);
        }
    }
}
