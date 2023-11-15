<%-- 
    Document   : home.jsp
    Created on : 14 de out. de 2023, 14:18:18
    Author     : joaov
--%>

<%@page import="controller.product.RandomSequenceGenerator"%>
<%@page import="model.product.Product"%>
<%@page import="model.artist.Artist"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <% request.setAttribute("pageTitle", "StardustCard - Home");%>
    <%@include file="./components/head.jsp" %>

    <body>
        <div class="container">
            <% request.setAttribute("activePage", "home");%>
            <%@include file="./components/navbar.jsp" %>
        </div>
        <div class="slideshow">
            <div class="slideshow-container">
                <div class="slide fade">
                    <div class="slide_text">
                        <div class="slide_title">Find your next photocard here</div>
                        <div class="slide_subtitle">Rare photocards available only on StardustCard!</div>
                        <div class="slider-dots">
                            <span class="dot" id="active-dot" onclick="currentSlide(1)"></span>
                            <span class="dot" onclick="currentSlide(2)"></span>
                            <span class="dot" onclick="currentSlide(3)"></span>
                        </div>
                    </div>
                    <img src="${pageContext.request.contextPath}/assets/slide/slide_img_1.png" class="slide_img">
                </div>
                <div class="slide fade">
                    <div class="slide_text">
                        <div class="slide_title">New additions every week</div>
                        <div class="slide_subtitle">All new releases available!</div>
                        <div class="slider-dots">
                            <span class="dot" onclick="currentSlide(1)"></span>
                            <span class="dot" id="active-dot" onclick="currentSlide(2)"></span>
                            <span class="dot" onclick="currentSlide(3)"></span>
                        </div>
                    </div>
                    <img src="${pageContext.request.contextPath}/assets/slide/slide_img_2.png" class="slide_img">
                </div>
                <div class="slide fade">
                    <div class="slide_text">
                        <div class="slide_title">All your favorite idols</div>
                        <div class="slide_subtitle">The widest range of artists!</div>
                        <div class="slider-dots">
                            <span class="dot" onclick="currentSlide(1)"></span>
                            <span class="dot" onclick="currentSlide(2)"></span>
                            <span class="dot" id="active-dot" onclick="currentSlide(3)"></span>
                        </div>
                    </div>
                    <img src="${pageContext.request.contextPath}/assets/slide/slide_img_3.png" class="slide_img">
                </div>
            </div>
        </div>
        <div class="container" id="body">
            <div class="bundles" id="artists">
                <h2>artists</h2>
                <div class="carrousel-container">
                    <span class="material-symbols-rounded" onclick="moveCarousel(-1)">
                        arrow_back_ios_new
                    </span>
                    <div class="carrousel">
                        <%                            List<Artist> artistList = (List<Artist>) request.getAttribute("artistsList");
                            for (int i = 0; i < artistList.size(); i++) {
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
                    <span class="material-symbols-rounded" onclick="moveCarousel(1)">
                        arrow_forward_ios
                    </span>
                </div>
            </div>
            <div class="bundles" id="last-units">
                <h2>last units</h2>
                <div class="photocards">
                    <%
                        List<Product> lastUnits = (List<Product>) request.getAttribute("lastUnits");
                        int j = 5;
                        if (lastUnits.size() < 5) {
                            j = lastUnits.size();
                        }
                        for (int i = 0; i < j; i++) {
                            Product product = lastUnits.get(i);
                            String uri = RandomSequenceGenerator.generateRandomSequence(15);
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
                        int k = 5;
                        if (newAdds.size() < 5) {
                            k = newAdds.size();
                        }
                        for (int i = 0; i < k; i++) {
                            Product product = newAdds.get(i);
                            String uri = RandomSequenceGenerator.generateRandomSequence(15);
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
        </div>

        <%@include file="./components/footer.jsp" %>
        <script src="${pageContext.request.contextPath}/client/script.js"></script>
    </body>

</html>
