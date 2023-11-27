<%-- 
    Document   : sellings
    Created on : 10 de nov. de 2023, 09:26:12
    Author     : joaov
--%>

<%@page import="model.user.UserDAO"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="model.product.Product"%>
<%@page import="model.sale.Sale"%>
<%@page import="model.Highlight"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
    <%@include file="./components/head.jsp" %>

    <body>
        <!-- Sidebar -->
        <%request.setAttribute("activePage", "sellings");%>
        <%@include file="./components/sidebar.jsp" %>
        <!-- Content Page -->
        <div class="content">
            <!-- Message -->
            <%request.setAttribute("title", "Sellings");%>
            <%request.setAttribute("subtitle", "Let's sell more and more.");%>
            <%@include file="./components/message.jsp" %>

            <!-- Content -->
            <main>
                <!-- Highlights -->
                <div class="sellings-higlight">
                    <%  List<Highlight> highlights = new ArrayList<>();
                        highlights.add(new Highlight("Total Sales", "$30,000.00", ""));
                        highlights.add(new Highlight("Net Profit", "$15,000.00", ""));
                        highlights.add(new Highlight("Items Sold", "500", ""));
                        highlights.add(new Highlight("Average Price", "$60.00", ""));

                        for (Highlight highlight : highlights) {
                    %>

                    <%request.setAttribute("highlightTitle", highlight.getHighlightTitle());%>
                    <%request.setAttribute("highlightDescription", highlight.getHighlightDescription());%>
                    <%request.setAttribute("typeClass", highlight.getTypeClass());%>
                    <%@include file="./components/highlight.jsp" %>

                    <%}%>                    
                </div>
                <!-- Order By -->
                <div class="order-by">
                    <select id="order-select" class="order-select">
                        <option value="null">Order by</option>
                        <option value="sale-id">Sale ID</option>
                        <option value="photocard">Photocard</option>
                        <option value="price">Price</option>
                        <option value="user">User</option>
                        <option value="date">Date</option>
                    </select>
                </div>
                <!-- Sales -->
                <% List<Sale> sales = (List<Sale>) request.getAttribute("sales");%>
                <div class="sales">
                    <table>
                        <thead>
                            <tr>
                                <th>Sale ID</th>
                                <th>Photocard</th>
                                <th>Price</th>
                                <th>User</th>
                                <th>Date</th>
                                <th>Options</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% for (Sale sale : sales) {%>
                            <tr>
                                <td><%= sale.getId()%></td>
                                <%
                                    double amount = 0.0;
                                    List<String> photocards = new ArrayList<>();
                                    for (Product product : sale.getProducts().keySet()) {
                                        amount += product.getAmount() * product.getPrice();
                                        photocards.add(product.getDescription());
                                    }
                                    DecimalFormat df = new DecimalFormat("#.##");
                                    String total = df.format(amount);
                                    UserDAO u = new UserDAO();
                                    User user = u.getOne(sale.getUserId());
                                %>

                                <td>
                                    <ul style="text-align: left; padding: 0">
                                        <% for (String photocard : photocards) {%>
                                        <li><%= photocard%></li>
                                            <%}%>
                                    </ul>
                                </td>
                                <td>R$ <%= total%></td>
                                <td><%= user.getName()%></td>
                                <%
                                    // Converter o Timestamp para LocalDateTime
                                    LocalDateTime localDateTime = sale.getDate().toLocalDateTime();
                                    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
                                    String date = localDateTime.format(formatter);
                                %>
                                <td><%= date%></td>
                                <td><button class="options-btn">&#8942;</button></td>
                            </tr>
                            <% }%>

                        </tbody>
                    </table>
                </div>

            </main>
        </div>

        <script src="${pageContext.request.contextPath}/admin/main.js"></script>
    </body>

</html>
