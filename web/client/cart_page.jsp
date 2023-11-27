<%-- 
    Document   : cart_page
    Created on : 27 de nov. de 2023, 09:58:03
    Author     : Yanna
--%>

<%@page import="java.util.Map"%>
<%@page import="model.product.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <%
        request.setAttribute("pageTitle", "StardustCard - Cart");
        boolean empty = (boolean) request.getAttribute("empty");

        double subtotal = 0;
    %>
    <%@include file="./components/head.jsp" %>
    <body>
        <div class="container" id="body">
            <% request.setAttribute("activePage", "cart");
            %>
            <%@include file="./components/navbar.jsp" %>
            <div class="cart">
                <div id="big-title">Shopping Cart</div>
                <% if (!empty) {
                        Map<Product, Integer> products = (Map<Product, Integer>) request.getAttribute("products");
                %>
                <div class="cart-container">
                    <div class="cart-products-cont">
                        <%
                            for (Map.Entry<Product, Integer> entry : products.entrySet()) {
                                Product p = entry.getKey();
                                int q = entry.getValue();

                                subtotal = subtotal + q * p.getPrice();
                        %>
                        <div class="cart-product">
                            <img src="<%= p.getPicture()%>">
                            <div class="cart-product-details">
                                <div class="product-details">
                                    <div class="product-title" style="margin-top: 25px;">
                                        <%= p.getDescription()%>
                                    </div>
                                </div>
                                <div class="price-stock-info">
                                    <div class="price-info">R$ <%= p.getPrice()%></div>
                                    <%
                                        String stock;
                                        String color = "#379635";
                                        int j = 5;
                                        if (p.getAmount() <= 5) {
                                            stock = "Only " + p.getAmount() + " units left";
                                            color = "#CC224B";
                                            j = 1;
                                        } else {
                                            stock = "In Stock";
                                        }
                                    %>
                                    <div class="stock-info" style="color: <%= color%>;"><%= stock%></div>
                                </div>
                                <div class="product-actions-checkout" style="align-items: baseline">
                                    <div class="product-quantity" style="height: fit-content;">
                                        <label>Quantity:</label>
                                        <select id="quantitySelector<%= p.getId()%>"  onchange="updateQuantity(<%= p.getId()%>)">
                                            <% for (int i = 1; i <= Math.min(p.getAmount(), j); i++) {%>
                                            <option value="<%= i%>" <%= (i == q) ? "selected" : ""%>><%= i%></option>
                                            <% }%>
                                        </select>
                                    </div>
                                    <button class="delete-button" onclick="window.location.href = '${pageContext.request.contextPath}/RemoveAllItems?productId=<%= p.getId()%>'">Delete</button>
                                </div>
                            </div>
                        </div>
                        <script>
                            function updateQuantity(productId) {
                                var quantitySelector = document.getElementById('quantitySelector' + productId);
                                var selectedQuantity = quantitySelector.value;
                                // Prepare data to be sent to the servlet
                                var data = 'productId=' + productId + '&quantity=' + selectedQuantity;
                                window.location.href = '${pageContext.request.contextPath}/UpdateQuantity?' + data;
                            }
                        </script>
                        <%
                            }
                        %>
                        <div class="sub-total">
                            <hr class="rounded">
                            <div class="values">
                                <div class="amount">Sub-total (<%= totalCart%> items):&nbsp&nbsp</div>
                                <div class="sub-total-value">R$ <%= subtotal%></div>
                            </div>
                        </div>
                    </div>
                    <div class="cart-total" style="height: fit-content;">
                        <h3>Total</h3>
                        <div class="cart-total-info">
                            <div class="values">
                                <div class="amount">Sub-total:&nbsp&nbsp</div>
                                <div class="sub-total-value">R$ <%= subtotal%></div>
                            </div>
                            <div class="values">
                                <div class="amount">Delivery:&nbsp&nbsp</div>
                                <div class="delivery">Free</div>
                            </div>
                        </div>
                        <button class="checkout">Checkout</button>
                    </div>
                </div>
                <%} else { %>
                <div style="align-items: center;display: flex;flex-direction: column;">
                    <img src="${pageContext.request.contextPath}/client/assets/cart.png" style="width: 35%"/>
                    <h2>Your cart is empty!</h2>
                    <a href="${pageContext.request.contextPath}/Home"><button style="margin-top: 0">Go shopping!</button></a>
                </div>
                <% }%>
            </div>
        </div>
        <%@include file="./components/footer.jsp" %>
        <script src="${pageContext.request.contextPath}/client/script.js"></script>
    </body>
</html>