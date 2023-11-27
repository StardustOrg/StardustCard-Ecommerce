<%-- 
    Document   : cart_page
    Created on : 27 de nov. de 2023, 09:58:03
    Author     : Yanna
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <%
        request.setAttribute("pageTitle", "StardustCard - Cart");
        boolean empty = (boolean) request.getAttribute("empty");
    %>
    <%@include file="./components/head.jsp" %>
    <body>
        <div class="container" id="body">
            <% request.setAttribute("activePage", "cart");
            %>
            <%@include file="./components/navbar.jsp" %>
            <div class="cart">
                <div id="big-title">Shopping Cart</div>
                <div class="cart-container">
                    <% if (!empty) { %>
                    <div class="cart-products-cont">
                        <div class="cart-product">
                            <img src="">
                            <div class="cart-product-details">
                                <div class="product-details">
                                    <label>NewJeans Hanni</label>
                                    <div class="product-title">Official New Jeans Lightstick Photocards / Bunnies Tokkis
                                    </div>
                                </div>
                                <div class="price-stock-info">
                                    <div class="price-info">R$ 50,95</div>
                                    <div class="stock-info">In stock</div>
                                </div>
                                <div class="product-actions-checkout">
                                    <div class="product-quantity" style="height: fit-content;">
                                        <label>Quantity:</label>
                                        <select id="quantitySelector">
                                            <option value="1">1</option>
                                            <option value="2" selected>2</option>
                                            <option value="3">3</option>
                                            <option value="4">4</option>
                                            <option value="5">5</option>
                                        </select>
                                    </div>
                                    <button class="delete-button">Delete</button>
                                </div>
                            </div>
                        </div>
                        <div class="sub-total">
                            <hr class="rounded">
                            <div class="values">
                                <div class="amount">Sub-total (3 items):&nbsp&nbsp</div>
                                <div class="sub-total-value">R$ 202,40</div>
                            </div>
                        </div>
                    </div>
                    <div class="cart-total">
                        <h3>Total</h3>
                        <div class="cart-total-info">
                            <div class="values">
                                <div class="amount">Sub-total:&nbsp&nbsp</div>
                                <div class="sub-total-value">R$ 202,40</div>
                            </div>
                            <div class="values">
                                <div class="amount">Delivery:&nbsp&nbsp</div>
                                <div class="delivery">Free</div>
                            </div>
                        </div>
                        <button class="checkout">Checkout</button>
                    </div>
                    <%} else { %>
                    <img scr="${pageContext.request.contextPath}/client/assets/cart.png"/>
                    <% }%>
                </div>
            </div>
        </div>
        <%@include file="./components/footer.jsp" %>
        <script src="${pageContext.request.contextPath}/client/script.js"></script>
    </body>
</html>