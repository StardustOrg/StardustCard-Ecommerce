<%@page import="java.util.List"%>
<%@page import="model.artist.Artist"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.Map" %>

<%
    Artist artistL = (Artist) request.getAttribute("artist");
    List< Artist> artistsL = (List<Artist>) request.getAttribute("artists");
%>

<!-- Modal para edição -->
<div class="artist-card">
    <div class="artist-image">
        <img src="<%= artistL.getIcon()%>" />
        <div class="overlay"></div>
        <!-- Adicione um atributo data-* para armazenar as informações do artista -->
        <button onclick="openEditModal('<%= artistL.getName()%>', '<%= artistL.getIcon()%>', '<%= artistL.getCover()%>', '<%= artistL.getGroupId()%>')" class="edit"> Edit </button>
        <div class="image-caption">
            <%= artistL.getName()%>
        </div>
    </div>
</div>

<!-- Modal para edição -->
<div id="editModal" class="modal" style="display: none">
    <div class="add-photocard-content">
        <div class="add-photocard-content-head">
            <button class="btn-close" onclick="closeEditModal()">✕</button>
            <h3 class="modal-title">Edit Artist</h3>
        </div>
        <div class="add-photocard-content-body">
            <div class="add-photocard-img">
                <div class="single-product">
                    <div class="part-1">
                        <img src="<%= artistL.getIcon()%>" id=editPhotocardInput" class="photocard-img" />
                    </div>
                </div>
            </div>
            <div class="add-photocard-form">
                <form id="editForm" action="<%=request.getContextPath()%>/Admin/Artists" method="POST">
                    <h4 class="photocard-input-title">Artist name</h4>
                    <input class="photocard-input" type="text" id="editName" name="editName" value="<%= artistL.getName()%>" />

                    <h4 class="photocard-input-title">Image URL</h4>
                    <input class="photocard-input" type="text" id="editPhoto" name="editPhoto" value="<%= artistL.getIcon()%>" />

                    <h4 class="photocard-input-title">Cover URL</h4>
                    <input class="photocard-input" type="text" id="editCover" name="editCover" value="<%= artistL.getCover()%>" />

                    <div style="display: flex; justify-content: start">
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
                            <% for (Artist groupArtist : artistsL) { %>
                            <% if (groupArtist.getGroupId() == 0) {%>
                            <option name="editGroupId" value="<%= groupArtist.getId()%>"><%= groupArtist.getName()%></option>
                            <% } %>
                            <% }%>
                        </select>
                    </div>
                    <button class="btn" onclick="saveArtistChanges()">Save</button>
                </form>
            </div>
        </div>
    </div>
</div>

<script>
    // Função para abrir o modal de edição
    function openEditModal(name, photo, cover, groupId) {
        document.getElementById("editName").value = name;
        document.getElementById("editPhoto").value = photo;
        document.getElementById("editCover").value = cover;
        document.getElementById("editIsIdol").checked = groupId !== 'null';
        document.getElementById("editGroupSelection").style.display = groupId !== 'null' ? 'flex' : 'none';
        document.getElementById("editGroupDropdown").value = groupId;
        document.getElementById("editModal").style.display = "block";
    }

    // Função para fechar o modal de edição
    function closeEditModal() {
        document.getElementById("editModal").style.display = "none";
    }

    // Função para salvar as alterações do artista
    function saveArtistChanges() {
        // Adicione o código para enviar os dados para o servidor (pode usar AJAX)
        // Depois de salvar, feche o modal
        closeEditModal();
    }

    // Adiciona um evento de mudança ao checkbox
    document.getElementById('editIsIdol').addEventListener('change', function () {
        // Obtém a referência ao elemento de seleção de grupo
        var groupSelection = document.getElementById('editGroupSelection');
        // Define a exibição do elemento de seleção de grupo com base no estado do checkbox
        groupSelection.style.display = this.checked ? 'flex' : 'none';
    });
</script>
