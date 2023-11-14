<%-- 
    Document   : 500
    Created on : 13 de nov. de 2023, 20:54:50
    Author     : Yanna
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="theme-color" content="#317EFB"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/assets/stardust.png">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Rounded" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/error/style.css">
        <title>StardustCard - Not Found</title>
    </head>
    <body>
        <img src="${pageContext.request.contextPath}/error/assets/500.png" alt="sda">
        <div class="content">
            <h1>500: Internal Server Error</h1>
            <p>Something happend to our servers! Please try again latter</p>
            <button onclick="window.location.href='${pageContext.request.contextPath}/Home';">Return to Home</button>
        </div>
    </body>
</html>
