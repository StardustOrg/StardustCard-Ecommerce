<%-- 
    Document   : sidebar
    Created on : 10 de nov. de 2023, 09:20:02
    Author     : joaov
--%>
<%@page import="model.user.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.Map" %>

<div class="sidebar" id="sidebar">
    <%User adminUser = (User) session.getAttribute("stardust_user");%>
    <div>
        <!-- User info -->
        <div class="user-info">
            <a class="link-img" href="/StardustCard-Ecommerce/Admin/User">
                <img src="${pageContext.request.contextPath}/admin/assets/user.png" style="width: 90px; height: 90px;" alt="Foto do Usuário">
                <h4><%=adminUser.getName()%></h4>
                <h5>Stardust Manager</h5>
            </a>
        </div>
        <!-- Navegation -->
        <nav>
            <%-- Verificando qual página está ativa --%>
            <%
                String activePage = (String) request.getAttribute("activePage");
            %>
            <a href="/StardustCard-Ecommerce/Admin/Dashboard" class="<%= (activePage.equals("dashboard")) ? "active" : ""%>">
                <span class="material-symbols-outlined small">
                    monitoring
                </span>
                <span>Dashboard</span>
            </a>
            <a href="/StardustCard-Ecommerce/Admin/Sellings" class="<%= (activePage.equals("sellings")) ? "active" : ""%>">
                <span class="material-symbols-outlined small">
                    payments
                </span>
                <span class="link-text">Sellings</span>
            </a>
            <a href="/StardustCard-Ecommerce/Admin/Photocards" class="<%= (activePage.equals("photocards")) ? "active" : ""%>">
                <span class="material-symbols-outlined small">
                    playing_cards
                </span>
                <span class="link-text">Photocards</span>
            </a>
            <a href="/StardustCard-Ecommerce/Admin/Artists" class="<%= (activePage.equals("artists")) ? "active" : ""%>">
                <span class="material-symbols-outlined small">
                    groups
                </span>
                <span class="link-text">Artists</span>
            </a>
            <a href="/StardustCard-Ecommerce/Admin/Reports"  class="<%= (activePage.equals("reports")) ? "active" : ""%>">
                <span class="material-symbols-outlined small">
                    flag
                </span>
                <span class="link-text">Reports</span>
            </a>
        </nav>
    </div>
    <%-- LogOUt --%>
    <nav>      
        <a href="${pageContext.request.contextPath}/LogOut" style="border: 0; justify-content: center" id="logout">
            <span class="material-symbols-outlined small">
                logout
            </span>
            <span class="link-text">Logout</span>
        </a>
        <style>
            #logout:hover{
                background: #CC224B;
                color: #FFF;
            }
        </style>
    </nav>
</div>

<!-- Menu Hamburguer -->
<div class="menu-icon" onclick="toggleSidebar()">
    <span class="material-symbols-outlined">
        menu
    </span>
</div>
