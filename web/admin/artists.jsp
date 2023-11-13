<%-- 
    Document   : artists
    Created on : 10 de nov. de 2023, 09:26:21
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
            <!-- Message -->
            <%request.setAttribute("title", "Artists");%>
            <%request.setAttribute("subtitle", "Let's see your artists.");%>
            <%@include file="./components/message.jsp" %>

            <!-- Content -->
            <main>
                <!-- Search -->
                <div class="search">
                    <input type="text" placeholder="Search.." class="search-bar">
                </div>
                <div class="artists-row">
                    <!-- Filters -->
                    <section class="filters">
                        <button onclick="myFunction()" class="dropbtn">Artistas</button>
                        <button onclick="myFunction()" class="dropbtn">Grupos</button>
                        <button onclick="myFunction()" class="dropbtn">Mais populares</button>
                    </section>
                    <section class="artists">
                        <!-- Modal insert artist -->
                        <section class="modal active hidden">
                            <div class="add-photocard-content">
                                <div class="add-photocard-content-head">
                                    <button class="btn-close">✕</button>
                                    <h3 class="modal-title">Add a new Artist</h3>
                                </div>
                                <div class="add-photocard-content-body">
                                    <div class="add-photocard-img">
                                        <div class="single-product">
                                            <div class="part-1">
                                                <img src="" id="photcard-input" class="photocard-img" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="add-photocard-form" style="">
                                        <form>
                                            <h4 class="photocard-input-title">Artist name</h4>
                                            <input class="photocard-input" type="text" id="artist-name" placeholder="Nome do Artista" />

                                            <h4 class="photocard-input-title">Image URL</h4>
                                            <input class="photocard-input" type="text" id="photocard-url" placeholder="URL da Imagem" />

                                            <h4 class="photocard-input-title">Cover URL</h4>
                                            <input class="photocard-input" type="text" id="cover-url" placeholder="URL do Cover" />

                                            <div style="display: flex; justify-content: start">
                                                <h4 class="photocard-input-title">Belong to a group?</h4>
                                                <input type="checkbox" id="is-idol" style="width: 15px; height:15px; margin-bottom: 10px"/>
                                            </div>

                                            <div id="group-selection" style="display: none;
                                                 flex-direction: column;
                                                 justify-content: end;
                                                 width: 435px;
                                                 margin-left: 175px;">
                                                <select class="photocard-input" id="group-dropdown" style="height: 30px; width: 100%">
                                                    <!-- Opções do grupo aqui -->
                                                    <option value="none">No-group</option>
                                                    <option value="grupo1">Grupo 1</option>
                                                    <option value="grupo2">Grupo 2</option>
                                                </select>
                                            </div>
                                        </form>

                                        <script>
                                            // Adiciona um evento de mudança ao checkbox
                                            document.getElementById('is-idol').addEventListener('change', function () {
                                                // Obtém a referência ao elemento de seleção de grupo
                                                var groupSelection = document.getElementById('group-selection');
                                                // Define a exibição do elemento de seleção de grupo com base no estado do checkbox
                                                groupSelection.style.display = this.checked ? 'flex' : 'none';
                                            });
                                        </script>

                                    </div>
                                </div>
                            </div>
                            <button class="btn">Save</button>
                        </section>

                        <div class="single-product">
                            <div class="part-1" id="new-photocard" style="max-height: 155px;">
                                <button class="add-new" style="height: 100px; top: 45%"> Add </button>
                            </div>
                            <div class="part-2">
                                <h3 class="product-title">Add a new Artist</h3>
                            </div>
                        </div>
                        <!-- Single Product -->
                        <%//TODO: Listar artistas e iterá-los%>
                        <%request.setAttribute("artistName", "New Jeans");%>
                        <%request.setAttribute("artistPath", "");%>
                        <%@include file="./components/artist.jsp" %>
                    </section>
                </div>
        </div>


    </main>
</div>

<script src="${pageContext.request.contextPath}/admin/main.js"></script>
</body>

</html>