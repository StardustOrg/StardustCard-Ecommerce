<%-- 
    Document   : my_orders_page
    Created on : 29 de nov. de 2023, 10:08:19
    Author     : Yanna
--%>

<%@page import="java.util.Map"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.product.Product"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="model.sale.Sale"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <% request.setAttribute("pageTitle", "StardustCard - Profile");%>
    <%@include file="./components/head.jsp" %>
    <body>
        <div class="container" id="body">
            <% request.setAttribute("activePage", "orders");
            %>
            <%@include file="./components/navbar.jsp" %>
            <h2 class="profile-heading">My Orders</h2>
            <div class="profile-container">
                <div class="profile-options-cont">
                    <a href="Profile">
                        <div class="profile-option">
                            <span class="material-symbols-rounded">
                                account_circle
                            </span>
                            My Details
                        </div>
                    </a>
                    <a href="Orders">
                        <div class="selected profile-option">
                            <span class="material-symbols-rounded">
                                orders
                            </span>
                            My Orders
                        </div>
                    </a>
                </div>
                <div class="profile-info-cont">
                    <h3>Your orders</h3>
                    <p style="width: 45%;">
                        This is a list of your orders.
                    </p>
                    <%                        List<Sale> mySales = (List<Sale>) request.getAttribute("mySales");
                        SimpleDateFormat dateFormatter = new SimpleDateFormat("dd/MM/yyyy");
                        DecimalFormat decfor = new DecimalFormat("00.00");
                    %>
                    <div class="orders-cont">
                        <table>
                            <tr>
                                <th>Order Number</th>
                                <th>Products</th>
                                <th>Date</th>
                                <th>Total</th>
                            </tr>

                            <%
                                for (int i = 0; i < mySales.size(); i++) {
                                    Sale sale = mySales.get(i);

                                    double amount = 0.0;
                                    List<Product> photocards = new ArrayList<>();
                                    for (Map.Entry<Product, Integer> entry : sale.getProducts().entrySet()) {
                                        Product product = entry.getKey();
                                        int q = entry.getValue();
                                        amount += q * product.getPrice();
                                        photocards.add(product);
                                    }
                                    String formattedNumber = String.format("%04d", sale.getId());
                                    String date = dateFormatter.format(sale.getDate());
                                    String price = decfor.format(amount);
                            %>
                            <tr>
                                <td>#<%= formattedNumber%></td>
                                <td>
                                    <ul style="text-align: left; padding: 0">
                                        <%
                                            for (Map.Entry<Product, Integer> entry : sale.getProducts().entrySet()) {
                                                Product p = entry.getKey();
                                                int q = entry.getValue();
                                        %>
                                        <p><%= p.getDescription()%> (Quant: <%= q%>)</p>
                                        <%
                                            }
                                        %>
                                    </ul>
                                </td>
                                <td><%= date%></td>
                                <td>R$ <%= price%></td>
                                
                            </tr>
                            <%
                                }
                            %>
                        </table>
                    </div>
                </div>
            </div> 
        </div>
        <%@include file="./components/footer.jsp" %>
        <script>
        </script>
    </body>
</html>
