<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <% request.setAttribute("pageTitle", "StardustCard - Login");%>
    <%@include file="./components/head.jsp" %>
    <body>
        <div class="container" id="body">
            <% request.setAttribute("activePage", "login");%>
            <%@include file="./components/navbar.jsp" %>
            <div class="login_form">
                <form method="post">
                    <h2>Sign in</h2>
                    <label>Email:</label>
                    <input type="email" name="email" id="email" placeholder="Email" required>
                    <label>Password:</label>
                    <input type="password" name="password" id="password" placeholder="Password" required>
                    <a class="text_link">Forgot password?</a>
                    <button>Sign In</button>
                </form>
            </div>
            <div class="secondary-action">
                <div class="secondary-message">
                    <div class="divider"></div>
                    New Here?
                    <div class="divider"></div>
                </div>
                <a href="register.jsp">
                    <button>Create Account</button>
                </a>
            </div>
        </div>
        <%@include file="./components/footer.jsp" %>
        <script src="script.js"></script>
    </body>
</html>
