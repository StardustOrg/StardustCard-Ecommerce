<%-- 
    Document   : artist_page
    Created on : 27 de out. de 2023, 12:43:37
    Author     : Yanna
--%>

<%@page import="model.artist.Artist"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    /*Artist artist = (Artist) request.getAttribute("artist");*/
    boolean group = (boolean) request.getAttribute("group");
%>
<!DOCTYPE html>
<html lang="en">
    <% request.setAttribute("pageTitle", "StardustCard - COLOCAR NOME AQUI");%>
    <%@include file="./components/head.jsp" %>
    <body>
        <div class="container">
            <% request.setAttribute("activePage", "artists");
            %>
            <%@include file="./components/navbar.jsp" %>
        </div>
        <%
            if (group) {
        %>
        <div>Group</div>
        <%
        } else {
        %>
        <div>Idol</div>
        <%
            }
        %>

    </body>
</html>
