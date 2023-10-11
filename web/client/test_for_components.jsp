<%-- 
    Document   : test_for_components
    Created on : 11 de out. de 2023, 19:05:05
    Author     : Yanna
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <% request.setAttribute("pageTitle", "StardustCard - Test");%>
    <%@include file="./components/head.jsp" %>
    <body>
        <div class="container" id="body">
            <% request.setAttribute("activePage", "test");
            %>
            <%@include file="./components/navbar.jsp" %>
            <div>
                <%
                    request.setAttribute("cardTitle", "Taste of Love Version 03 Nayeon");
                    request.setAttribute("imageUrl", "");
                %>
                <%@include file="./components/simple_photocard.jsp" %>
            </div>
        </div>
        <%@include file="./components/footer.jsp" %>
        <script src="script.js"></script>
    </body>
</html>
