<%-- 
    Document   : sellings
    Created on : 10 de nov. de 2023, 09:26:12
    Author     : joaov
--%>

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
            <div class="message">
                <h1>Sellings</h1>
                <p>Let's sell more and more.</p>
            </div>
            <!-- Content -->
            <main>
                <!-- Highlights -->
                <div class="sellings-higlight">
                    <div class="highlight">
                        <h4>Total Sales</h4>
                        <h5>$30,000.00</h5>
                    </div>
                    <div class="pipe-divisor"></div>
                    <div class="highlight">
                        <h4>Net Profit</h4>
                        <h5>$15,000.00</h5>
                    </div>
                    <div class="pipe-divisor"></div>
                    <div class="highlight">
                        <h4>Items Sold</h4>
                        <h5>500</h5>
                    </div>
                    <div class="pipe-divisor"></div>
                    <div class="highlight">
                        <h4>Average Price</h4>
                        <h5>$60.00</h5>
                    </div>
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
                            <tr>
                                <td>020</td>
                                <td>Random Photocard</td>
                                <td>R$ 25,00</td>
                                <td>Alice Johnson</td>
                                <td>2023-09-05</td>
                                <td><button class="options-btn">&#8942;</button></td>
                            </tr>
                            <tr>
                                <td>020</td>
                                <td>Random Photocard</td>
                                <td>R$ 25,00</td>
                                <td>Alice Johnson</td>
                                <td>2023-09-05</td>
                                <td><button class="options-btn">&#8942;</button></td>
                            </tr>
                            <tr>
                                <td>020</td>
                                <td>Random Photocard</td>
                                <td>R$ 25,00</td>
                                <td>Alice Johnson</td>
                                <td>2023-09-05</td>
                                <td><button class="options-btn">&#8942;</button></td>
                            </tr>
                            <tr>
                                <td>020</td>
                                <td>Random Photocard</td>
                                <td>R$ 25,00</td>
                                <td>Alice Johnson</td>
                                <td>2023-09-05</td>
                                <td><button class="options-btn">&#8942;</button></td>
                            </tr>
                            <tr>
                                <td>020</td>
                                <td>Random Photocard</td>
                                <td>R$ 25,00</td>
                                <td>Alice Johnson</td>
                                <td>2023-09-05</td>
                                <td><button class="options-btn">&#8942;</button></td>
                            </tr>
                            <tr>
                                <td>020</td>
                                <td>Random Photocard</td>
                                <td>R$ 25,00</td>
                                <td>Alice Johnson</td>
                                <td>2023-09-05</td>
                                <td><button class="options-btn">&#8942;</button></td>
                            </tr>
                            <tr>
                                <td>020</td>
                                <td>Random Photocard</td>
                                <td>R$ 25,00</td>
                                <td>Alice Johnson</td>
                                <td>2023-09-05</td>
                                <td><button class="options-btn">&#8942;</button></td>
                            </tr>
                            <tr>
                                <td>020</td>
                                <td>Random Photocard</td>
                                <td>R$ 25,00</td>
                                <td>Alice Johnson</td>
                                <td>2023-09-05</td>
                                <td><button class="options-btn">&#8942;</button></td>
                            </tr>
                            <tr>
                                <td>020</td>
                                <td>Random Photocard</td>
                                <td>R$ 25,00</td>
                                <td>Alice Johnson</td>
                                <td>2023-09-05</td>
                                <td><button class="options-btn">&#8942;</button></td>
                            </tr>
                            <tr>
                                <td>020</td>
                                <td>Random Photocard</td>
                                <td>R$ 25,00</td>
                                <td>Alice Johnson</td>
                                <td>2023-09-05</td>
                                <td><button class="options-btn">&#8942;</button></td>
                            </tr>
                            <tr>
                                <td>020</td>
                                <td>Random Photocard</td>
                                <td>R$ 25,00</td>
                                <td>Alice Johnson</td>
                                <td>2023-09-05</td>
                                <td><button class="options-btn">&#8942;</button></td>
                            </tr>
                            <tr>
                                <td>020</td>
                                <td>Random Photocard</td>
                                <td>R$ 25,00</td>
                                <td>Alice Johnson</td>
                                <td>2023-09-05</td>
                                <td><button class="options-btn">&#8942;</button></td>
                            </tr>
                            <tr>
                                <td>020</td>
                                <td>Random Photocard</td>
                                <td>R$ 25,00</td>
                                <td>Alice Johnson</td>
                                <td>2023-09-05</td>
                                <td><button class="options-btn">&#8942;</button></td>
                            </tr>
                            <tr>
                                <td>020</td>
                                <td>Random Photocard</td>
                                <td>R$ 25,00</td>
                                <td>Alice Johnson</td>
                                <td>2023-09-05</td>
                                <td><button class="options-btn">&#8942;</button></td>
                            </tr>
                            <tr>
                                <td>020</td>
                                <td>Random Photocard</td>
                                <td>R$ 25,00</td>
                                <td>Alice Johnson</td>
                                <td>2023-09-05</td>
                                <td><button class="options-btn">&#8942;</button></td>
                            </tr>
                            <tr>
                                <td>020</td>
                                <td>Random Photocard</td>
                                <td>R$ 25,00</td>
                                <td>Alice Johnson</td>
                                <td>2023-09-05</td>
                                <td><button class="options-btn">&#8942;</button></td>
                            </tr>
                            <tr>
                                <td>020</td>
                                <td>Random Photocard</td>
                                <td>R$ 25,00</td>
                                <td>Alice Johnson</td>
                                <td>2023-09-05</td>
                                <td><button class="options-btn">&#8942;</button></td>
                            </tr>
                            <tr>
                                <td>020</td>
                                <td>Random Photocard</td>
                                <td>R$ 25,00</td>
                                <td>Alice Johnson</td>
                                <td>2023-09-05</td>
                                <td><button class="options-btn">&#8942;</button></td>
                            </tr>
                            <tr>
                                <td>020</td>
                                <td>Random Photocard</td>
                                <td>R$ 25,00</td>
                                <td>Alice Johnson</td>
                                <td>2023-09-05</td>
                                <td><button class="options-btn">&#8942;</button></td>
                            </tr>
                            <tr>
                                <td>020</td>
                                <td>Random Photocard</td>
                                <td>R$ 25,00</td>
                                <td>Alice Johnson</td>
                                <td>2023-09-05</td>
                                <td><button class="options-btn">&#8942;</button></td>
                            </tr>
                            <tr>
                                <td>020</td>
                                <td>Random Photocard</td>
                                <td>R$ 25,00</td>
                                <td>Alice Johnson</td>
                                <td>2023-09-05</td>
                                <td><button class="options-btn">&#8942;</button></td>
                            </tr>
                            <tr>
                                <td>020</td>
                                <td>Random Photocard</td>
                                <td>R$ 25,00</td>
                                <td>Alice Johnson</td>
                                <td>2023-09-05</td>
                                <td><button class="options-btn">&#8942;</button></td>
                            </tr>
                            <tr>
                                <td>020</td>
                                <td>Random Photocard</td>
                                <td>R$ 25,00</td>
                                <td>Alice Johnson</td>
                                <td>2023-09-05</td>
                                <td><button class="options-btn">&#8942;</button></td>
                            </tr>
                            <tr>
                                <td>020</td>
                                <td>Random Photocard</td>
                                <td>R$ 25,00</td>
                                <td>Alice Johnson</td>
                                <td>2023-09-05</td>
                                <td><button class="options-btn">&#8942;</button></td>
                            </tr>
                            <tr>
                                <td>020</td>
                                <td>Random Photocard</td>
                                <td>R$ 25,00</td>
                                <td>Alice Johnson</td>
                                <td>2023-09-05</td>
                                <td><button class="options-btn">&#8942;</button></td>
                            </tr>
                        </tbody>
                    </table>
                </div>

            </main>
        </div>

        <script src="${pageContext.request.contextPath}/admin/main.js"></script>
    </body>

</html>
