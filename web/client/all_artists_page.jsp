<%-- 
    Document   : all_artists_page
    Created on : 10 de nov. de 2023, 13:26:33
    Author     : Yanna
--%>

<%@page import="java.util.List"%>
<%@page import="model.artist.Artist"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <%
        request.setAttribute("pageTitle", "StardustCard - Artists");
        List<Artist> artistList = (List<Artist>) request.getAttribute("artistsList");
    %>
    <%@include file="./components/head.jsp" %>
    <body>
        <div class="container" id="body">
            <% request.setAttribute("activePage", "artists");
            %>
            <%@include file="./components/navbar.jsp" %>
            <div class="bundles" id="artists">
                <h2>artists</h2>
                <div class="artists-container" id="all-artists">
                    <%                        for (int i = 0; i < artistList.size(); i++) {
                            Artist artist = artistList.get(i);
                    %>
                    <a href="Artists/<%= artist.getName()%>">
                        <div class="artist-card">
                            <div class="artist-image">
                                <img src="<%= artist.getIcon()%>" />
                                <div class="overlay"></div>
                                <div class="image-caption">
                                    <%= artist.getName()%>
                                </div>
                            </div>
                        </div>
                    </a>
                    <%                            }
                    %>
                </div>
            </div>
            <%
                for (int i = 0; i < artistList.size(); i++) {
                    Artist artist = artistList.get(i);
            %>
            <div class="bundles" id="<%= artist.getName()%>">
                <h2><%= artist.getName()%></h2>
                <div class="photocards">
                    <%
                        for (int j = 0; j < 5; j++) {
                    %>
                    <div class="card">
                        <div id="photo">
                            <img src="" alt="Avatar">
                        </div>
                        <div class="card-title"><%= j%></div>
                    </div>
                    <%                            }
                    %>
                </div>
            </div>
            <%                            }
            %>
        </div>
        <%@include file="./components/footer.jsp" %>
        <script src="${pageContext.request.contextPath}/client/script.js"></script>
    </body>
</html>