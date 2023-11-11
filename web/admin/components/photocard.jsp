<%-- 
    Document   : photocard
    Created on : 10 de nov. de 2023, 14:52:15
    Author     : joaov
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.Map" %>

<%
    String photocardName = (String) request.getAttribute("photocardName");
    Integer photocardUnits = (Integer) request.getAttribute("photocardUnits");
    String photocardPath = (String) request.getAttribute("photocardPath");
%>

<div class="column-container">
    <div class="single-product">
        <div class="part-1">
            <button onclick="myFunction()" class="edit"> Edit </button>
            <img src="<%=photocardPath%>" class="photocard-img" />
        </div>
        <div class="part-2">
            <h3 class="product-title"><%=photocardName%></h3>
            <div class="part-2-2">
                <h5 class="product-units"><%=photocardUnits%> units</h5>
                <button class="product-add-more">Add more</button>
            </div>

        </div>
    </div>
</div>
