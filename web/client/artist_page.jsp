<%-- 
    Document   : artist_page
    Created on : 27 de out. de 2023, 12:43:37
    Author     : Yanna
--%>

<%@page import="java.util.List"%>
<%@page import="model.artist.Artist"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    /*Artist artist = (Artist) request.getAttribute("artist");*/
    boolean group = (boolean) request.getAttribute("group");
%>
<!DOCTYPE html>
<html lang="en">
    <% request.setAttribute("pageTitle", "StardustCard - Artists");
        Artist artist = (Artist) request.getAttribute("artistInfo");
    %>
    <%@include file="./components/head.jsp" %>
    <body>
        <div class="container">
            <% request.setAttribute("activePage", "artists");
            %>
            <%@include file="./components/navbar.jsp" %>
        </div>
        <div class="cover">
            <img src="<%= artist.getCover()%>" />
            <div class="cover-caption">
                <%= artist.getName()%>
            </div>
        </div>
        <div class="container" id="body"><%
            if (group) {
            %>
            <div class="bundles" id="members">
                <h2>members</h2>
                <div class="artists-container">
                    <%
                        List<Artist> artistList = (List<Artist>) request.getAttribute("idols");
                        for (int i = 0; i < artistList.size(); i++) {
                            Artist member = artistList.get(i);
                    %>
                    <form id="form_<%= i%>" action="Artists/<%= artist.getName()%>/<%= member.getName()%>" method="post">
                        <input type="hidden" name="artistId" value="<%= member.getId()%>" />
                        <div class="artist-card" onclick="submitForm('form_<%= i%>')">
                            <div class="artist-image">
                                <img src="<%= member.getIcon()%>" />
                                <div class="overlay"></div>
                                <div class="image-caption">
                                    <%= member.getName()%>
                                </div>
                            </div>
                        </div>
                    </form>
                    <%                            }
                    %>
                </div>
            </div>
            <%
            } else {
            %>
            <div>Idol</div>
            <%
                }
            %>
            <div class="bundles" id="last-units">
                <h2>last units</h2>
                <div class="photocards">
                    <%
                        for (int i = 0; i < 5; i++) {
                    %>
                    <div class="card">
                        <div id="photo">
                            <img src="" alt="Avatar">
                        </div>
                        <div class="card-title">BTS Proof RM Photocard</div>
                        <div class="card-detail">5 units left</div>
                    </div>
                    <%                            }
                    %>
                </div>
            </div>
            <div class="bundles" id="new-additions">
                <h2>new additions</h2>
                <div class="photocards">
                    <%
                        for (int i = 0; i < 5; i++) {
                    %>
                    <div class="card">
                        <div id="photo">
                            <img src="" alt="Avatar">
                        </div>
                        <div class="card-title">Taste of Love Version 03 Nayeon</div>
                    </div>
                    <%                            }
                    %>  
                </div>
            </div>
        </div>


        <%@include file="./components/footer.jsp" %>
        <script src="${pageContext.request.contextPath}/client/script.js"></script>
    </body>
</html>
