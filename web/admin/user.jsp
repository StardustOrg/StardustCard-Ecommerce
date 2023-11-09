<%-- 
    Document   : user
    Created on : 8 de nov. de 2023, 21:11:16
    Author     : joaov
--%>

<!DOCTYPE html>
<html lang="pt-br">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>StardustCard | Admin</title>
        <link rel="icon" type="image/png" href="./assets/stardust.png">
        <!-- Styles and icons -->
        <link rel="stylesheet"
              href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/style.css">
    </head>

    <body>
         <!-- Sidebar -->
        <%request.setAttribute("activePage", "");%>
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
                                <img class="user-image" src="${pageContext.request.contextPath}/admin/assets/user.jpg" alt="">
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