<%-- 
    Document   : photocards
    Created on : 10 de nov. de 2023, 09:26:29
    Author     : joaov
--%>

<%@page import="java.util.List"%>
<%@page import="model.product.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
    <%@include file="./components/head.jsp" %>

    <body>
        <!-- Sidebar -->
        <%request.setAttribute("activePage", "photocards");%>
        <%@include file="./components/sidebar.jsp" %>

        <!-- Content Page -->
        <div class="content">
            <!-- Message -->
            <%request.setAttribute("title", "Photocards");%>
            <%request.setAttribute("subtitle", "Let's see your product.");%>
            <%@include file="./components/message.jsp" %>

            <!-- Content -->
            <main>
                <!-- Search -->
                <div class="search">
                    <input type="text" placeholder="Search.." class="search-bar">
                </div>
                <div class="photocards-row">
                    <!-- Filters -->
                    <section class="filters">
                        <button class="dropbtn">Artists</button>
                        <button class="dropbtn">Trending</button>
                        <button class="dropbtn">Last units</button>
                        <button class="dropbtn">Price</button>
                    </section>

                    <!-- Photocards -->
                    <section class="photocards">
                        <!-- Single Product -->
                        <div class="column-container">
                            <!-- Modal insert photocard -->
                            <section class="modal active hidden" style="height: 550px">
                                <div class="add-photocard-content">

                                    <div class="add-photocard-content-head">
                                        <button class="btn-close">✕</button>
                                        <h3 class="modal-title">Add a new photocard</h3>
                                    </div>

                                    <div class="add-photocard-content-body">
                                        <div class="add-photocard-img">
                                            <div class="single-product">
                                                <div class="part-1">
                                                    <img src="" id="photcard-input" class="photocard-img" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="add-photocard-form">
                                            <form action="" method="POST">
                                                <h4 class="photocard-input-title">Photocard name</h4>
                                                <input class="photocard-input" type="text" id="photocard-name"
                                                       placeholder="Photocard name" />

                                                <h4 class="photocard-input-title">Artist name</h4>
                                                <div class="checkbox-container">
                                                    <label><input type="checkbox" name="artist" value="artist1"> Artist 1</label><br>
                                                    <label><input type="checkbox" name="artist" value="artist2"> Artist 2</label><br>
                                                    <label><input type="checkbox" name="artist" value="artist3"> Artist 3</label><br>
                                                    <label><input type="checkbox" name="artist" value="artist4"> Artist 4</label><br>
                                                    <label><input type="checkbox" name="artist" value="artist5"> Artist 5</label><br>
                                                </div>

                                                <h4 class="photocard-input-title" style="padding-left: 100px">Image URL</h4>
                                                <input class="photocard-input" type="text" id="photocard-url"
                                                       placeholder="Photocard's image URL" 
                                                       style="margin-left: 176px"/>

                                                <div class="unit-price" style="margin-left: 175px;">
                                                    <div>
                                                        <h4 class="photocard-input-title">Units</h4>
                                                        <input class="photocard-input" type="number" id="photocard-units"
                                                               placeholder="00" />
                                                    </div>

                                                    <div>
                                                        <h4 class="photocard-input-title">Price</h4>
                                                        <input class="photocard-input" type="number" id="photocard-price"
                                                               placeholder="00" />
                                                    </div>

                                                </div>


                                            </form>


                                        </div>


                                    </div>

                                </div>
                                <button class="btn">Save</button>
                            </section>

                            <div class="single-product">
                                <div class="part-1" id="new-photocard">
                                    <button class="add-new"> Add </button>
                                </div>
                                <div class="part-2">
                                    <h3 class="product-title">Add a new photocard</h3>
                                </div>
                            </div>
                        </div>

                        <%List<Product> photocards = (List<Product>) request.getAttribute("photocards");%>
                        <%
                            for (Product photocardL : photocards) {
                        %>

                        <%request.setAttribute("photocard", photocardL);%>
                        <%@include file="./components/photocard.jsp" %>

                        <%}%>
                    </section>
                </div>
            </main>
        </div>

        <script src="${pageContext.request.contextPath}/admin/main.js"></script>
    </body>

</html>
