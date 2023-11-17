<%-- 
    Document   : photocard
    Created on : 10 de nov. de 2023, 14:52:15
    Author     : joaov
--%>

<%@page import="model.product.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.Map" %>

<%
    Product photocard = (Product) request.getAttribute("photocard");
%>

<div class="column-container">
    <div class="single-product">
        <div class="part-1">
            <button onclick="openEditModal(
                            '<%= photocard.getId()%>',
                            '<%= photocard.getDescription()%>',
                            '<%= photocard.getPicture()%>',
                            '<%= photocard.getAmount()%>',
                            '<%= photocard.getPrice()%>',
                            '<%= photocard.getArtists()%>')" 
                    class="edit"> Edit </button>
            <img src="<%=photocard.getPicture()%>" class="photocard-img" />
        </div>
        <div class="part-2">
            <h3 class="product-title"><%=photocard.getDescription()%></h3>
            <div class="part-2-2">
                <h5 class="product-units"><%=photocard.getAmount()%> units</h5>
                <button class="product-add-more">Add more</button>
            </div>

        </div>
    </div>
</div>
