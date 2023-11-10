<%-- 
    Document   : users[
    Created on : 10 de nov. de 2023, 09:26:35
    Author     : joaov
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
    <%@include file="./components/head.jsp" %>

    <body>
        <!-- Sidebar -->
        <%request.setAttribute("activePage", "artists");%>
        <%@include file="./components/sidebar.jsp" %>
        
        <!-- Content Page -->
        <div class="content">
            <div class="message">
                <h1>Vládia Helen</h1>
                <p>Let's check your data.</p>
            </div>
            <!-- Content -->
            <main>
                <div class="user-data">
                    <form>
                        <div class="user-container">
                            <div class="image-container">
                                <img class="user-image" src="./assets/user.jpg" alt="">
                                <div class="upload-button">
                                    <label for="file-upload">
                                        <i class="fa fa-upload"></i> Upload Image
                                    </label>
                                    <input type="file" id="file-upload" style="display:none;">
                                </div>
                            </div>
                            <div class="group-data-user">
                                <label>Name:</label>
                                <input type="text" name="name" id="name" placeholder="Name">
                                <label>Login:</label>
                                <input type="email" name="email" id="email" placeholder="Email">
                                <label>Password:</label>
                                <input type="password" name="password" id="password" placeholder="Password">
                                <button>Save</button>
                            </div>

                        </div>
                    </form>

                </div>
            </main>
        </div>
        <script src="${pageContext.request.contextPath}/admin/main.js"></script>
    </body>

</html>