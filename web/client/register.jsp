<%-- 
    Document   : register
    Created on : 11 de out. de 2023, 18:42:16
    Author     : Yanna
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <% request.setAttribute("pageTitle", "StardustCard - Register");%>
    <%@include file="./components/head.jsp" %>
    <body>
        <div class="container" id="body">
            <% request.setAttribute("activePage", "register");%>
            <%@include file="./components/navbar.jsp" %>
            <div class="register_form">
                <form method="POST" action="${pageContext.request.contextPath}/Register" onsubmit="return validateRegisterForm()">
                    <h2>Create account</h2>
                    <label>Your Name:</label>
                    <input type="text" name="name" id="name" placeholder="First and last name" required>
                    <label>Address:</label>
                    <input type="text" name="address" id="address" placeholder="Your address" required>
                    <label>Email:</label>
                    <input type="email" name="email" id="email" placeholder="Your email" required>
                    <label>Login:</label>
                    <input type="text" name="login" id="login" placeholder="At least 6 characters" required>
                    <label>Password:</label>
                    <input type="password" name="password" id="password" placeholder="At least 6 characters" required>
                    <label>Confirm Password:</label>
                    <input type="password" name="confirm-password" id="confirm-password" placeholder="Repeat your password"
                           required>
                    <button>Register</button>
                </form>
            </div>
            <div class="secondary-action">
                <div class="secondary-message">
                    <div class="divider"></div>
                    Already have an account?
                    <div class="divider"></div>
                </div>
                <a href="${pageContext.request.contextPath}/Login">
                    <button>Sign in</button>
                </a>
            </div>
        </div>
        <%@include file="./components/footer.jsp" %>
        <script src="script.js"></script>
    </body>
</html>
