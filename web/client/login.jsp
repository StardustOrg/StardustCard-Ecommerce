<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <% request.setAttribute("pageTitle", "StardustCard - Login");%>
    <%@include file="./components/head.jsp" %>
    <body>
        <div class="container" id="body">
            <% request.setAttribute("activePage", "login");%>
            <%@include file="./components/navbar.jsp" %>
            <div class="login_form">
                <form method="POST" action="${pageContext.request.contextPath}/Login" onsubmit="return validateLoginForm()">
                    <h2>Sign in</h2>
                    <label>Login:</label>
                    <input type="text" name="login" id="login" placeholder="Login" required>
                    <label>Password:</label>
                    <input type="password" name="password" id="password" placeholder="Password" required>
                    <a class="text_link">Forgot password?</a>
                    <button>Sign In</button>
                </form>
                <!-- Adicione a condicional para exibir a mensagem -->
                <% if (request.getAttribute("registered") != null && (boolean) request.getAttribute("registered")) { %>
                <div class="registered-message">
                    Agora você pode fazer login.
                </div>
                <% }%>
            </div>
            <div class="secondary-action">
                <div class="secondary-message">
                    <div class="divider"></div>
                    New Here?
                    <div class="divider"></div>
                </div>
                <a href="${pageContext.request.contextPath}/Register">
                    <button>Create Account</button>
                </a>
            </div>
        </div>
        <%@include file="./components/footer.jsp" %>
        <script src="client/script.js"></script>
    </body>
</html>
