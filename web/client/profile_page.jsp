<%-- 
    Document   : profile_page
    Created on : 8 de nov. de 2023, 15:35:19
    Author     : Yanna
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <% request.setAttribute("pageTitle", "StardustCard - Profile");%>
    <%@include file="./components/head.jsp" %>
    <body>
        <div class="container" id="body">
            <% request.setAttribute("activePage", "profile");
               %>
            <%@include file="./components/navbar.jsp" %>
            <h2>Sign in</h2>
            <div></div>
        </div>
    </body>
</html>
