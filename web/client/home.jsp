<%-- 
    Document   : home.jsp
    Created on : 14 de out. de 2023, 14:18:18
    Author     : joaov
--%>

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
                    <img src="../assets/slide/slide_img_1.png" class="slide_img">
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
                    <img src="../assets/slide/slide_img_2.png" class="slide_img">
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
                    <img src="../assets/slide/slide_img_3.png" class="slide_img">
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
                        <%
                            List<Artist> artistList = (List<Artist>) request.getAttribute("artistsList");
                            for (int i = 0; i < artistList.size(); i++) {
                                Artist artist = artistList.get(i);
                        %>
                        <form id="form_<%= i%>" action="Artists/<%= artist.getName()%>" method="post">
                            <input type="hidden" name="artistId" value="<%= artist.getId()%>" />
                            <div class="artist-card" onclick="submitForm('form_<%= i%>')">
                                <div class="artist-image">
                                    <img src="<%= artist.getIcon()%>" />
                                    <div class="overlay"></div>
                                    <div class="image-caption">
                                        <%= artist.getName()%>
                                    </div>
                                </div>
                            </div>
                        </form>
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
