<%-- 
    Document   : product_page
    Created on : 13 de nov. de 2023, 10:26:34
    Author     : Yanna
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page import="controller.product.RandomSequenceGenerator"%>
<%@page import="model.artist.Artist"%>
<%@page import="java.util.List"%>
<%@page import="model.product.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%
        request.setAttribute("pageTitle", "StardustCard - Artists");

        DecimalFormat decfor = new DecimalFormat("0.00");
        Product product = (Product) request.getAttribute("product");
    %>
    <%@include file="./components/head.jsp" %>
    <body>
        <div class="container" id="body">
            <%
                request.setAttribute("activePage", "artists");
            %>
            <%@include file="./components/navbar.jsp" %>
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
                    <form id="addProduct" style="margin: 0" action="${pageContext.request.contextPath}/AddProduct" method="POST">
                        <div class="product-details">
                            <div class="price-tag" style="margin-top: 10px;">R$ <%= decfor.format(product.getPrice())%></div>
                            <%
                                String stock;
                                String color = "#379635";
                                int j = 5;
                                if (product.getAmount() <= 5) {
                                    stock = "Only " + product.getAmount() + " units left";
                                    color = "#CC224B";
                                    j = 1;
                                } else {
                                    stock = "In Stock";
                                }
                            %>
                            <div class="product-stock" style="color: <%= color%>;"><%= stock%></div>
                            <input name="productId" value="<%= product.getId()%>" type="hidden"/>
                            <div class="product-quantity">
                                <label style="margin: 0;">Quantity:</label>
                                <select id="quantitySelector" name="quantity">
                                    <% for (int i = 1; i <= j; i++) {%>
                                    <option value="<%= i%>"><%= i%></option>
                                    <% } %>
                                </select>
                            </div>
                        </div>
                    </form>
                    <div class="product-actions">
                        <button onclick="submitForm('addProduct')">Add to card</button>
                        <button class="secondary-button" onclick="updateFormAndSubmit()">Buy now</button>
                    </div>
                    <script>
                        function updateFormAndSubmit() {
                            var form = document.getElementById('addProduct');
                            form.action = "${pageContext.request.contextPath}/BuyNow";
                            submitForm('addProduct');
                        }
                    </script>
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
