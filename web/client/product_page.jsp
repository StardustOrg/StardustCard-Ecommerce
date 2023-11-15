<%-- 
    Document   : product_page
    Created on : 13 de nov. de 2023, 10:26:34
    Author     : Yanna
--%>

<%@page import="controller.product.RandomSequenceGenerator"%>
<%@page import="model.artist.Artist"%>
<%@page import="java.util.List"%>
<%@page import="model.product.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%
        request.setAttribute("pageTitle", "StardustCard - Artists");

        Product product = (Product) request.getAttribute("product");
    %>
    <%@include file="./components/head.jsp" %>
    <body>
        <div class="container" id="body">
            <%
                request.setAttribute("activePage", "artists");
            %>
            <%@include file="./components/navbar.jsp" %>
            <!--            <div class="navigation_path">
                            <a href="${pageContext.request.contextPath}/Home">Home</a> >
                            <a href="${pageContext.request.contextPath}/Artists">Artists</a> >
                            <a href="${pageContext.request.contextPath}/Artists/NewJeans">NewJeans</a> >
                            <a href="${pageContext.request.contextPath}/Artists/NewJeans/Hanni">Hanni</a>
                        </div>-->
            <div class="product" style="margin-top: 25px;">
                <img src="<%= product.getPicture()%>">
                <div class="product-container" style="margin-top: 30px; max-width: 45%;">
                    <div class="product-info">
                        <!--<div class="product-artist">NewJeans Hanni</div>-->
                        <div class="product-name"><%= product.getDescription()%></div>
                        <div class="product-tags">
                            <%
                                List<Artist> tags = product.getArtists();
                                for (int i = 0; i < tags.size(); i++) {
                                    Artist tag = tags.get(i);
                            %>
                            <a href="${pageContext.request.contextPath}/Artists/<%= tag.getName()%>"><div class="tag"><%= tag.getName()%></div></a>
                                <%
                                    }
                                    if (product.getAmount() <= 5) { // units <= 5
                                %>
                            <a><div class="tag">Last Units</div></a>
                            <%
                                }
                            %>
                        </div>
                    </div>
                    <div class="product-details">
                        <div class="price-tag" style="margin-top: 10px;">R$ <%= product.getPrice()%></div>
                        <%
                            String stock;
                            String color = "#379635";
                            if (product.getAmount() <= 5) {
                                stock = "Only " + product.getAmount() + " units left";
                                color = "#CC224B";
                            } else {
                                stock = "In Stock";
                            }
                        %>
                        <div class="product-stock" style="color: <%= color%>;"><%= stock%></div>
                        <div class="product-quantity">
                            <label style="margin: 0;">Quantity:</label>
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
                    <%
                        List<Product> newAdds = (List<Product>) request.getAttribute("newAdds");
                        int k = 5;
                        if (newAdds.size() < 5) {
                            k = newAdds.size();
                        }
                        for (int i = 0; i < k; i++) {
                            Product newProduct = newAdds.get(i);
                            String uri = RandomSequenceGenerator.generateRandomSequence(15);
                    %>
                    <form id="formNA_<%= i%>" method="POST" action="${pageContext.request.contextPath}/Artists/Product/<%= uri%>" class="photocard-form">
                        <input type="hidden" name="productId" value="<%= newProduct.getId()%>">
                        <div class="card" onclick="submitForm('formNA_<%= i%>')">
                            <div id="photo">
                                <img src="<%= newProduct.getPicture()%>" alt="Avatar">
                            </div>
                            <div class="card-title"><%= newProduct.getDescription()%></div>
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
