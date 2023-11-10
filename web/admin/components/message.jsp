<%-- 
    Document   : message
    Created on : 10 de nov. de 2023, 09:53:02
    Author     : joaov
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.Map" %>
<%
    String title = (String) request.getAttribute("title");
    String subtitle = (String) request.getAttribute("subtitle");
%>
<!-- Message -->
<div class="message">
    <h1><%=title%></h1>
    <p><%=subtitle%></p>
</div>
