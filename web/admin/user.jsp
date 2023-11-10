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
        <%request.setAttribute("activePage", "");%>
        <%@include file="./components/sidebar.jsp" %>

        <!-- Content Page -->
        <div class="content">
            <!-- Message -->
            <%User user = (User) session.getAttribute("stardust_user");%>
            <%request.setAttribute("title", user.getName());%>
            <%request.setAttribute("subtitle", "Let's check your data.");%>
            <%@include file="./components/message.jsp" %>
            
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
                                <input type="text" name="name" id="name" placeholder="Name" value="<%=user.getName()%>">
                                <label>Login:</label>
                                <input type="email" name="email" id="email" placeholder="Email" value="<%=user.getEmail()%>">
                                <label>Password:</label>
                                <input type="password" name="password" id="password" placeholder="Password" value="<%=user.getPassword()%>">
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