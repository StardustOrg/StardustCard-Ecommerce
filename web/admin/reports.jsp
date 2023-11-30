<%-- 
    Document   : users[
    Created on : 10 de nov. de 2023, 09:26:35
    Author     : joaov
--%>

<%@page import="model.user.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
    <%@include file="./components/head.jsp" %>

    <body>
        <!-- Sidebar -->
        <%request.setAttribute("activePage", "reports");%>
        <%@include file="./components/sidebar.jsp" %>
        <!-- Content Page -->
        <div class="content">
            <!-- Message -->
            <%request.setAttribute("title", "Reports");%>
            <%request.setAttribute("subtitle", "Let's report your data.");%>
            <%@include file="./components/message.jsp" %>

            <!-- Content -->
            <main>
                <div class="user-data">
                    <form id="userForm" action="<%=request.getContextPath()%>/Admin/Reports" method="POST">
                        <div class="user-container">
                            <div class="group-data-user">
                                <h2 style="text-align: left; margin-left: 15px">Select report type:</h2>
                                <select id="group-dropdown" name="group-id" style=" width: 100%;max-width: 327px;padding: 12px;border: 1px solid #8A94A0;font-size: 18px;margin-bottom: 15px; color: #8A94A0";>
                                    <option style="color: #8A94A0;" value="1" name="group-id">Sales by client</option>
                                    <option style="color: #8A94A0;" value="2" name="group-id">No Stock Products</option>
                                    <option style="color: #8A94A0;" value="3" name="group-id">Daily Billing</option>
                                </select>

                                <button class="btn" >Report</button>

                            </div>
                            <script>

                            </script>
                        </div>
                    </form>
                </div>
            </main>
        </div>
        <script src="${pageContext.request.contextPath}/admin/main.js"></script>
    </body>

</html>