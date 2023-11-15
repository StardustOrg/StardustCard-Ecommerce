<%-- 
    Document   : artist_page
    Created on : 27 de out. de 2023, 12:43:37
    Author     : Yanna
--%>

<%@page import="model.product.Product"%>
<%@page import="controller.product.RandomSequenceGenerator"%>
<%@page import="java.util.List"%>
<%@page import="model.artist.Artist"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
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
                    <a href="<%= artist.getName()%>/<%= member.getName()%>" style="width: 155px;">
                        <div class="artist-card">
                            <div class="artist-image">
                                <img src="<%= member.getIcon()%>" />
                                <div class="overlay"></div>
                                <div class="image-caption">
                                    <%= member.getName()%>
                                </div>
                            </div>
                        </div>
                    </a>
                    <%                            }
                    %>
                </div>
            </div>
            <%
                }
            %>
            <div class="bundles" id="last-units">
                <h2>last units</h2>
                <div class="photocards">
                    <%
                        List<Product> lastUnits = (List<Product>) request.getAttribute("lastUnits");

                        int j = 6;
                        if (lastUnits.size() < 6) {
                            j = lastUnits.size();
                        }
                        for (int i = 0; i < j; i++) {
                            String uri = RandomSequenceGenerator.generateRandomSequence(15);
                            Product product = lastUnits.get(i);
                    %>
                    <form id="formLU_<%= i%>" method="POST" action="${pageContext.request.contextPath}/Artists/Product/<%= uri%>" class="photocard-form">
                        <input type="hidden" name="productId" value="<%= product.getId()%>">
                        <div class="card" onclick="submitForm('formLU_<%= i%>')">
                            <div id="photo">
                                <img src="<%= product.getPicture()%>" alt="Avatar">
                            </div>
                            <div class="card-title"><%= product.getDescription()%></div>
                            <div class="card-detail"><%= product.getAmount()%> units left</div>
                        </div>
                    </form>
                    <%                            }
                    %>
                </div>
            </div>
            <div class="bundles" id="new-additions">
                <h2>new additions</h2>
                <div class="photocards">
                    <%
                        List<Product> newAdds = (List<Product>) request.getAttribute("newAdds");

                        int k = 6;
                        if (newAdds.size() < 6) {
                            k = newAdds.size();
                        }
                        for (int i = 0; i < k; i++) {
                            String uri = RandomSequenceGenerator.generateRandomSequence(15);
                            Product product = newAdds.get(i);
                    %>
                    <form id="formNA_<%= i%>" method="POST" action="${pageContext.request.contextPath}/Artists/Product/<%= uri%>" class="photocard-form">
                        <input type="hidden" name="productId" value="<%= product.getId()%>">
                        <div class="card" onclick="submitForm('formNA_<%= i%>')">
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
            <div class="bundles" id="all-photocards">
                <h2>complete collection</h2>
                <div class="photocards">
                    <%
                        List<Product> completeCollection = (List<Product>) request.getAttribute("completeCollection");

                        for (int i = 0; i < completeCollection.size(); i++) {
                            String uri = RandomSequenceGenerator.generateRandomSequence(15);
                            Product product = completeCollection.get(i);
                    %>
                    <form id="formAC_<%= i%>" method="POST" action="${pageContext.request.contextPath}/Artists/Product/<%= uri%>" class="photocard-form">
                        <input type="hidden" name="productId" value="<%= product.getId()%>">
                        <div class="card" onclick="submitForm('formAC_<%= i%>')">
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
        </div>


        <%@include file="./components/footer.jsp" %>
        <script src="${pageContext.request.contextPath}/client/script.js"></script>
    </body>
</html>
