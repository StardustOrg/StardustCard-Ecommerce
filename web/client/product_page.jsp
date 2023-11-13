<%-- 
    Document   : product_page
    Created on : 13 de nov. de 2023, 10:26:34
    Author     : Yanna
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%
        request.setAttribute("pageTitle", "StardustCard - Artists");
    %>
    <%@include file="./components/head.jsp" %>
    <body>
        <div class="container" id="body">
            <%
                request.setAttribute("activePage", "artists");
            %>
            <%@include file="./components/navbar.jsp" %>
            <div class="navigation_path">
                <a href="${pageContext.request.contextPath}/Home">Home</a> >
                <a href="${pageContext.request.contextPath}/Artists">Artists</a> >
                <a href="${pageContext.request.contextPath}/Artists/NewJeans">NewJeans</a> >
                <a href="${pageContext.request.contextPath}/Artists/NewJeans/Hanni">Hanni</a>
            </div>
            <div class="product">
                <img src="assets/photocard/hanni_bunnyland.png">
                <div class="product-container">
                    <div class="product-info">
                        <div class="product-artist">NewJeans Hanni</div>
                        <div class="product-name">NewJeans Photocard 'Bunnyland' Version</div>
                        <div class="product-tags">
                            <a><div class="tag">NewJeans</div></a>
                            <a><div class="tag">Hanni</div></a>
                            <%
                                if (true) { // units <= 5
                            %>
                            <a><div class="tag">Last Units</div></a>
                            <%
                                }
                            %>
                        </div>
                    </div>
                    <div class="product-details">
                        <div class="price-tag">R$ 100,00</div>
                        <div class="product-stock" style="color: #CC224B;">Only 4 units left</div>
                        <div class="product-quantity">
                            <label>Quantity:</label>
                            <select id="quantitySelector">
                                <option value=" 1">1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                                <option value="4">4</option>
                                <option value="5">5</option>
                            </select>
                        </div>
                    </div>
                    <div class="product-actions">
                        <button>Add to card</button>
                        <button class="secondary-button">Buy now</button>
                    </div>
                </div>
            </div>
            <div class="bundles" id="recommended">
                <h2>recommended</h2>
                <div class="photocards">
                    <div class="card">
                        <div id="photo">
                            <img src="./assets/photocard/bts_proof_rm.png" alt="Avatar">
                        </div>
                        <div class="card-title">BTS Proof RM Photocard</div>
                        <div class="card-detail">7 units left</div>
                    </div>
                    <div class="card">
                        <div id="photo">
                            <img src="./assets/photocard/hannie_bunnie_tokkis.png" alt="Avatar">
                        </div>
                        <div class="card-title">Official New Jeans Lightstick Photocards / Bunnies Tokkis</div>
                        <div class="card-detail">2 units left</div>
                    </div>
                    <div class="card">
                        <div id="photo">
                            <img src="./assets/photocard/ive_love_dive_wooyoung.png" alt="Avatar">
                        </div>
                        <div class="card-title">IVE Love Dive Wooyoung</div>
                        <div class="card-detail">5 units left</div>
                    </div>
                    <div class="card">
                        <div id="photo">
                            <img src="./assets/photocard/bp_ice_cream_jennie.png" alt="Avatar">
                        </div>
                        <div class="card-title">Ice Cream Physical Release Jennie</div>
                        <div class="card-detail">5 units left</div>
                    </div>
                    <div class="card">
                        <div id="photo">
                            <img src="./assets/photocard/txt_blue_hour_kai.png" alt="Avatar">
                        </div>
                        <div class="card-title">Blue Hour Version 01 Hueningkai</div>
                        <div class="card-detail">10 units left</div>
                    </div>
                </div>
            </div>
        </div>

        <%@include file="./components/footer.jsp" %>
        <script src="${pageContext.request.contextPath}/client/script.js"></script>
    </body>
</html>
