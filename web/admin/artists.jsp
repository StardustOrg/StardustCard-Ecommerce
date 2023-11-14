<%-- 
    Document   : artists
    Created on : 10 de nov. de 2023, 09:26:21
    Author     : joaov
--%>

<%@page import="java.util.List"%>
<%@page import="model.artist.Artist"%>
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
                        <%List<Artist> artists = (List<Artist>) request.getAttribute("artists");%>
                        <!-- Modal insert artist -->
                        <section class="modal active hidden">
                            <div class="add-photocard-content">
                                <div class="add-photocard-content-head">
                                    <button class="btn-close">✕</button>
                                    <h3 class="modal-title">Add a new Artist</h3>
                                </div>
                                <div class="add-photocard-content-body">
                                    <div class="add-photocard-img">
                                        <div class="single-product"  style="height: 155px">
                                            <div class="part-1">
                                                <img src="" id="photcard-input" class="photocard-img" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="add-photocard-form" style="">
                                        <form action="<%=request.getContextPath()%>/Admin/Artists" method="POST">
                                            <input class="photocard-input" type="hidden" id="_method" name="_method" value="POST"/>
                                            <h4 class="photocard-input-title">Artist name</h4>
                                            <input class="photocard-input" type="text" id="artist-name" name="artist-name" placeholder="Nome do Artista" />

                                            <h4 class="photocard-input-title">Image URL</h4>
                                            <input class="photocard-input" type="text" id="photocard-url" name="photocard-url" placeholder="URL da Imagem" />

                                            <h4 class="photocard-input-title">Cover URL</h4>
                                            <input class="photocard-input" type="text" id="cover-url" name="cover-url" placeholder="URL do Cover" />

                                            <div style="display: flex; justify-content: start; margin-left: 175px">
                                                <h4 class="photocard-input-title">Belong to a group?</h4>
                                                <input type="checkbox" id="is-idol" name="is-idol" style="width: 15px; height:15px; margin-bottom: 10px"/>
                                            </div>

                                            <div id="group-selection" style="display: none;
                                                 flex-direction: column;
                                                 justify-content: end;
                                                 width: 435px;
                                                 margin-left: 175px;">
                                                <select class="photocard-input" id="group-dropdown" style="height: 30px; width: 100%">
                                                    <!-- Opções do grupo aqui -->
                                                    <option value="null" name="group-id">No-group</option>
                                                    <%for (Artist artist : artists) {%>
                                                    <% if (artist.getGroupId() == 0) {%>
                                                    <option name="group-id" value="<%=artist.getId()%>"><%=artist.getName()%></option>
                                                    <%}%>
                                                    <%}%>

                                                </select>
                                            </div>
                                            <div style="display: flex; margin: 100px; margin-top: 10px">
                                                <button class="btn">Save</button>
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
                        </section>


                        <div class="single-product" style="height: 120px; margin-bottom: 50px">
                            <div class="part-1" id="new-photocard" style="max-height: 155px;">
                                <button class="add-new" style="height: 100px; top: 45%"> Add </button>
                            </div>
                        </div>
                        <!-- Single Product -->
                        <%for (Artist artist : artists) {%>
                        <!-- Modal para edição -->
                        <div class="artist-card">
                            <div class="artist-image">
                                <img src="<%= artist.getIcon()%>" />
                                <div class="overlay"></div>
                                <!-- Adicione um atributo data-* para armazenar as informações do artista -->
                                <button onclick="openEditModal('<%= artist.getId()%>', '<%= artist.getName()%>', '<%= artist.getIcon()%>', '<%= artist.getCover()%>', '<%= artist.getGroupId()%>')" class="edit"> Edit </button>
                                <div class="image-caption">
                                    <%= artist.getName()%>
                                </div>
                            </div>
                        </div>

                        <%}%>

                        <!-- Modal para edição -->
                        <div class="overlay" id="overlay"></div>
                        <div id="editModal" class="modal" style="display: none">
                            <div class="add-photocard-content">
                                <div class="add-photocard-content-head">
                                    <button class="btn-close" onclick="closeEditModal()">✕</button>
                                    <h3 class="modal-title">Edit Artist</h3>
                                </div>
                                <div class="add-photocard-content-body">
                                    <div class="add-photocard-img">
                                        <div class="single-product" style="height: 155px">
                                            <div class="part-1">
                                                <img src="" id="editPhotocardInput" class="photocard-img" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="add-photocard-form">
                                        <form id="editForm" action="<%=request.getContextPath()%>/Admin/Artists" method="POST">
                                            <input class="photocard-input" type="hidden" id="_method" name="_method" value="PUT"/>
                                            <input class="photocard-input" type="hidden" id="artist-id" name="artist-id" value=""/>

                                            <h4 class="photocard-input-title">Artist name</h4>
                                            <input class="photocard-input" type="text" id="editName" name="editName" value="" />

                                            <h4 class="photocard-input-title">Image URL</h4>
                                            <input class="photocard-input" type="text" id="editPhoto" name="editPhoto" value="" />

                                            <h4 class="photocard-input-title">Cover URL</h4>
                                            <input class="photocard-input" type="text" id="editCover" name="editCover" value="" />

                                            <div style="display: flex; justify-content: start; margin-left: 175px">
                                                <h4 class="photocard-input-title">Belong to a group?</h4>
                                                <input type="checkbox" id="editIsIdol" name="editIsIdol" style="width: 15px; height:15px; margin-bottom: 10px" />
                                            </div>

                                            <div id="editGroupSelection" style="display: none;
                                                 flex-direction: column;
                                                 justify-content: end;
                                                 width: 435px;
                                                 margin-left: 175px;">
                                                <select class="photocard-input" id="editGroupDropdown" style="height: 30px; width: 100%">
                                                    <!-- Opções do grupo aqui -->
                                                    <option value="null" name="editGroupId">No-group</option>
                                                    <% for (Artist groupArtist : artists) { %>
                                                    <% if (groupArtist.getGroupId() == 0) {%>
                                                    <option name="editGroupId" value="<%= groupArtist.getId()%>"><%= groupArtist.getName()%></option>
                                                    <% } %>
                                                    <% }%>
                                                </select>
                                            </div>
                                            <div style="display: flex; justify-content: space-around; padding-left: 150px; margin-top: 20px">
                                                <button class="btn" >Update</button>
                                                <button class="btn" style="background: #CC224B;" onclick="onDelete();">Delete</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                </div>
        </div>


    </main>
</div>

<script src="${pageContext.request.contextPath}/admin/main.js"></script>
<script>
                                                    // Função para abrir o modal de edição
                                                    function openEditModal(id, name, photo, cover, groupId) {
                                                        console.log(groupId);
                                                        document.getElementById("artist-id").value = id;
                                                        document.getElementById("editPhotocardInput").src = photo;
                                                        document.getElementById("editName").value = name;
                                                        document.getElementById("editPhoto").value = photo;
                                                        document.getElementById("editCover").value = cover;
                                                        document.getElementById("editIsIdol").checked = groupId !== '0' ? true : false;
                                                        document.getElementById("editGroupSelection").style.display = groupId !== '0' ? 'flex' : 'none';
                                                        document.getElementById("editGroupDropdown").value = groupId;
                                                        document.getElementById("editModal").style.display = "block";
                                                    }

                                                    // Função para fechar o modal de edição
                                                    function closeEditModal() {
                                                        document.getElementById("editModal").style.display = "none";
                                                    }

                                                    // Função para salvar as alterações do artista
                                                    function saveArtistChanges() {

                                                        document.getElementById("_method").value = "PUT";
                                                        console.log(document.getElementById("_method").value);
                                                        document.getElementById("editForm").submit();
                                                    }

                                                    // Adiciona um evento de mudança ao checkbox
                                                    document.getElementById('editIsIdol').addEventListener('change', function () {
                                                        // Obtém a referência ao elemento de seleção de grupo
                                                        var groupSelection = document.getElementById('editGroupSelection');
                                                        // Define a exibição do elemento de seleção de grupo com base no estado do checkbox
                                                        groupSelection.style.display = this.checked ? 'flex' : 'none';
                                                    });

                                                    function onDelete() {
                                                        console.log("onDelete function called");
                                                        var confirmed = confirm("Tem certeza que deseja excluir este artista?");
                                                        if (confirmed) {
                                                            document.getElementById("editForm").action = '${pageContext.request.contextPath}/Admin/DeleteArtist';
                                                            document.getElementById("editForm").submit();
                                                        } else {
                                                            alert("Exclusão cancelada");
                                                        }
                                                    }



</script>
</body>

</html>