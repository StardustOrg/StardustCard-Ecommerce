<%-- 
    Document   : index.jsp
    Created on : 14 de out. de 2023, 14:34:26
    Author     : joaov
--%>

<%@page import="model.user.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
    <%@include file="./components/head.jsp" %>

    <body>
        <!-- Sidebar -->
        <%request.setAttribute("activePage", "dashboard");%>
        <%@include file="./components/sidebar.jsp" %>
        <!-- Content Page -->
        <div class="content">
            <!-- Message -->
            <%User user = (User) session.getAttribute("stardust_user");%>
            <%request.setAttribute("title", "Hello, " + user.getName());%>
            <%request.setAttribute("subtitle", "dashboard");%>
            <%@include file="./components/message.jsp" %>

            <!-- Content -->
            <main>
                <!-- Higlights -->
                <div class="highlights">
                    <div class="highlight billing">
                        <h4>Daily Billing</h4>
                        <h5>R$ 1000,00</h5>
                    </div>
                    <div class="highlight trending-photocard">
                        <h4>Trending Photocard</h4>
                        <h5>NewJeans Photocard 'Bunnyland' Version</h5>
                    </div>
                    <div class="highlight trending-artist">
                        <h4>Trending Artist</h4>
                        <h5>BTS</h5>
                    </div>
                </div>
                <!-- Charts -->
                <div class="charts">
                    <div class="chart" style="flex: 2; padding-right: 10px ;">
                        <h2 class="title">Monthly Report</h2>
                        <canvas id="monthlyReport" style="width: 100%; height: 80%;"></canvas>
                    </div>
                    <div class="chart" style="flex: 1;">
                        <h2 class="title">Week Sales</h2>
                        <canvas id="weekSales" style="width: 100%; height: 80%;"></canvas>
                    </div>
                </div>
                <!-- Last Sales -->
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
                            <tr>
                                <td>001</td>
                                <td>NewJeans Photocard 'Bunnyland' Version</td>
                                <td>R$ 50,00</td>
                                <td>John Doe</td>
                                <td>2023-09-08</td>
                                <td><button class="options-btn">&#8942;</button></td>
                            </tr>
                            <tr>
                                <td>002</td>
                                <td>Example Photocard</td>
                                <td>R$ 40,00</td>
                                <td>Jane Doe</td>
                                <td>2023-09-07</td>
                                <td><button class="options-btn">&#8942;</button></td>
                            </tr>
                            <tr>
                                <td>003</td>
                                <td>Another Photocard</td>
                                <td>R$ 35,00</td>
                                <td>Bob Smith</td>
                                <td>2023-09-06</td>
                                <td><button class="options-btn">&#8942;</button></td>
                            </tr>
                        </tbody>
                    </table>
                </div>

            </main>
        </div>

        <script src="${pageContext.request.contextPath}/admin/main.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    </body>

</html>
