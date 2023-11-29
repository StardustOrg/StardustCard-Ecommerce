<%-- 
    Document   : sellings
    Created on : 10 de nov. de 2023, 09:26:12
    Author     : joaov
--%>

<%@page import="model.report.card.CardSaleReport"%>
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
        <%
            request.setAttribute("activePage", "sellings");

            DecimalFormat df = new DecimalFormat("#.##");
        %>
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
                <% CardSaleReport card = (CardSaleReport) request.getAttribute("cardSales"); %>
                <div class="sellings-higlight">
                    <%  List<Highlight> highlights = new ArrayList<>();
                        highlights.add(new Highlight("Total Sales", "R$ " + df.format(card.getTotalValue()), ""));
                        highlights.add(new Highlight("Items Sold", df.format(card.getTotalItems()), ""));
                        highlights.add(new Highlight("Average Price", "R$ "+ df.format(card.getAverageValue()), ""));

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
                <form id="salesForms" method="POST">
                    <input type="hidden" id="saleId" name="saleId">
                </form>
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
                                    for (Map.Entry<Product, Integer> entry : sale.getProducts().entrySet()) {
                                        Product p = entry.getKey();
                                        int q = entry.getValue();
                                        amount += q * p.getPrice();
                                    }
                                    String total = df.format(amount);
                                    UserDAO u = new UserDAO();
                                    User user = u.getOne(sale.getUserId());
                                %>
                                <td>
                                    <div>
                                        <%
                                            for (Map.Entry<Product, Integer> entry : sale.getProducts().entrySet()) {
                                                Product p = entry.getKey();
                                                int q = entry.getValue();
                                        %>
                                        <p><%= p.getDescription()%> (Quant: <%= q%>)</p>
                                        <%
                                            }
                                        %>
                                    </div>
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
                                <td><button class="options-btn" onclick="deleteSale('<%= sale.getId()%>')">&#8942;</button></td>
                            </tr>
                            <% }%>

                        </tbody>
                    </table>
                </div>

            </main>
        </div>

        <script src="${pageContext.request.contextPath}/admin/main.js"></script>
        <script>
                                    function deleteSale(id) {
                                        var confirmed = confirm("Tem certeza que deseja excluir este venda?");
                                        if (confirmed) {
                                            document.getElementById("saleId").value = id;
                                            var form = document.getElementById("salesForms");
                                            form.submit();
                                        } else {
                                            alert("Exclusão cancelada");
                                        }
                                    }
        </script>
    </body>

</html>
