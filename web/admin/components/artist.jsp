<%-- 
    Document   : artist
    Created on : 10 de nov. de 2023, 15:01:38
    Author     : joaov
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.Map" %>

<%
    String artistName = (String) request.getAttribute("artistName");
    String artistPath = (String) request.getAttribute("artistPath");
%>

<div class="artist-card">
    <div class="artist-image">
        <img src="<%=artistPath%>" />
        <div class="overlay"></div>
        <button onclick="myFunction()" class="edit"> Edit </button>
        <div class="image-caption">
            <%=artistName%>
        </div>
    </div>
</div>
