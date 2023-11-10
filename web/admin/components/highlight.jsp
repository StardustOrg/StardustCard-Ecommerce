<%-- 
    Document   : highlight
    Created on : 10 de nov. de 2023, 14:12:42
    Author     : joaov
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.Map" %>

<%
    String highlightTitle = (String) request.getAttribute("highlightTitle");
    String highlightDescription = (String) request.getAttribute("highlightDescription");
    String typeClass = (String) request.getAttribute("typeClass");
%>

<div class="highlight <%=typeClass%>">
    <h4><%= highlightTitle%></h4>
    <h5><%=highlightDescription%></h5>
</div>
