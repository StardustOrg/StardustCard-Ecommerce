<%-- 
    Document   : all_artists_page
    Created on : 10 de nov. de 2023, 13:26:33
    Author     : Yanna
--%>

<%@page import="model.product.Product"%>
<%@page import="controller.product.RandomSequenceGenerator"%>
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
                    <a href="Artists/<%= artist.getName()%>" style="width: 155px;">
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

                    List<Product> artistProduct = (List<Product>) request.getAttribute(artist.getName());

                    if (artistProduct != null && artistProduct.size() != 0) {
            %>
            <div class="bundles" id="<%= artist.getName()%>">
                <h2><%= artist.getName()%></h2>
                <div class="photocards">
                    <%
                        int k = 6;

                        if (artistProduct.size() < 6) {
                            k = artistProduct.size();
                        }

                        for (int j = 0; j < k; j++) {
                            String uri = RandomSequenceGenerator.generateRandomSequence(15);
                            Product product = artistProduct.get(j);
                    %>
                    <form id="form<%= artist.getName()%>_<%= j%>" method="POST" action="${pageContext.request.contextPath}/Artists/Product/<%= uri%>" class="photocard-form">
                        <input type="hidden" name="productId" value="<%= product.getId() %>">
                        <div class="card" onclick="submitForm('form<%= artist.getName()%>_<%= j%>')">
                            <div id="photo">
                                <img src="<%= product.getPicture()%>" alt="Avatar">
                            </div>
                            <div class="card-title"><%= product.getDescription()%></div>
                        </div>
                    </form>
                    <%                            }
                    %>
                </div>
            </div>
            <%                            }
                }
            %>
        </div>
        <%@include file="./components/footer.jsp" %>
        <script src="${pageContext.request.contextPath}/client/script.js"></script>
    </body>
</html>