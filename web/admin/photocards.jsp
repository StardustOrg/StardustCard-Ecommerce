<%-- 
    Document   : photocards
    Created on : 10 de nov. de 2023, 09:26:29
    Author     : joaov
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="utils.Utils"%>
<%@page import="model.artist.Artist"%>
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
                    <input type="text" placeholder="Search.." class="search-bar" onkeyup="filterPhotocardsBySearch(this.value)">
                </div>
                <div class="photocards-row">
                    <!-- Filters -->
                    <section class="filters">
                        <button id="lastUnits" class="dropbtn" onclick="filterLastUnits()">Last units</button>
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
                                            <form action="<%=request.getContextPath()%>/Admin/Photocards" method="POST">
                                                <h4 class="photocard-input-title">Photocard name</h4>
                                                <input class="photocard-input" type="text" id="photocard-name" name="photocard-name"
                                                       placeholder="Photocard name" required/>

                                                <h4 class="photocard-input-title">Artist name</h4>
                                                <div class="checkbox-container"> 
                                                    <% List<Artist> artists = (List<Artist>) request.getAttribute("artists"); %>
                                                    <%for (Artist artist : artists) {%>                                                 
                                                    <label><input type="checkbox" name="artists" value="<%= artist.getId()%>"><%= artist.getName()%></label><br>
                                                        <%}%>
                                                </div>

                                                <h4 class="photocard-input-title" style="padding-left: 100px">Image URL</h4>
                                                <input class="photocard-input" type="text" id="photocard-url" name="photocard-url"
                                                       placeholder="Photocard's image URL" 
                                                       style="margin-left: 176px" required/>

                                                <div class="unit-price" style="margin-left: 175px;">
                                                    <div>
                                                        <h4 class="photocard-input-title">Units</h4>
                                                        <input class="photocard-input" type="number" id="photocard-units" name="photocard-units"
                                                               placeholder="00" required/>
                                                    </div>

                                                    <div>
                                                        <h4 class="photocard-input-title">Price</h4>
                                                        <input class="photocard-input" type="number" id="photocard-price" name="photocard-price"
                                                               placeholder="00" required/>
                                                    </div>

                                                </div>
                                                <div style="display: flex; justify-content: space-around; padding-left: 150px;">
                                                    <button class="btn">Save</button>
                                                </div>
                                            </form>


                                        </div>


                                    </div>

                                </div>
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

                        <% List<Product> photocards = (List<Product>) request.getAttribute("photocards"); %>
                        <%
                            for (Product photocard : photocards) {
                        %>
                        <div class="photocard-card column-container">
                            <div class="single-product">
                                <div class="part-1">
                                    <% StringBuffer desciption = new StringBuffer();
                                        desciption.append(photocard.getDescription());

                                        List<Artist> artistList = photocard.getArtists();
                                        List<Long> artistIds = new ArrayList<>();

                                        for (Artist artist : artistList) {
                                            artistIds.add(artist.getId());
                                        }

                                    %>
                                    <button onclick='openEditModal(<%= photocard.getId()%>, `<%= desciption%>`, "<%= photocard.getPicture()%>",<%= photocard.getAmount()%>, <%= photocard.getPrice()%>, <%= artistIds%>)' class="edit"> Edit </button>
                                    <img src ="<%=photocard.getPicture()%>" class="photocard-img" />
                                </div>
                                <div class="part-2">
                                    <h3 class="product-title"><%=photocard.getDescription()%></h3>
                                    <div class="part-2-2">
                                        <h5 class="product-units"><%=photocard.getAmount()%> units</h5>
                                        <button class="product-add-more">Add more</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <% }%>
                        <!-- Modal update photocard -->
                        <div class="overlay" id="overlay"></div>
                        <div id="editModal" class="modal" style="display: none; height: 550px">
                            <div class="add-photocard-content">
                                <div class="add-photocard-content-head">
                                    <button class="btn-close" onclick="closeEditModal()">✕</button>
                                    <h3 class="modal-title">Edit photocard</h3>
                                </div>

                                <div class="add-photocard-content-body">
                                    <div class="add-photocard-img">
                                        <div class="single-product">
                                            <div class="part-1">
                                                <img src="" id="editPhotcardInput" class="photocard-img" />
                                            </div>
                                        </div>
                                    </div>

                                    <div class="add-photocard-form">
                                        <form method="POST">
                                            <input type="hidden" name="id" id="edit_id">
                                            <h4 class="photocard-input-title">Photocard name</h4>
                                            <input class="photocard-input" type="text" id="edit-photocard-name" name="photocard-name"
                                                   placeholder="Photocard name" />

                                            <h4 class="photocard-input-title">Artist name</h4>
                                            <div id="edit-artists" class="checkbox-container"> 
                                                <%for (Artist artist : artists) {%>                                                 
                                                <label><input type="checkbox" name="artists" value="<%= artist.getId()%>"><%= artist.getName()%></label><br>
                                                    <%}%>
                                            </div>

                                            <h4 class="photocard-input-title" style="padding-left: 100px">Image URL</h4>
                                            <input class="photocard-input" type="text" id="edit-photocard-url" name="photocard-url"
                                                   placeholder="Photocard's image URL" 
                                                   style="margin-left: 176px"/>

                                            <div class="unit-price" style="margin-left: 175px;">
                                                <div>
                                                    <h4 class="photocard-input-title">Units</h4>
                                                    <input class="photocard-input" type="number" id="edit-photocard-units" name="photocard-units"
                                                           placeholder="00" />
                                                </div>

                                                <div>
                                                    <h4 class="photocard-input-title">Price</h4>
                                                    <input class="photocard-input" type="number" id="edit-photocard-price" name="photocard-price"
                                                           placeholder="00" />
                                                </div>

                                            </div>
                                            <div style="display: flex; justify-content: space-around; padding-left: 150px; margin-top: 20px">
                                                <button class="btn" onclick="onUpdate()">Update</button>
                                                <button class="btn" style="background: #CC224B;" onclick="onDelete()">Delete</button>
                                            </div>
                                        </form>


                                    </div>


                                </div>

                            </div>
                        </div>
                    </section>
                </div>
            </main>
        </div>

        <script src="${pageContext.request.contextPath}/admin/main.js"></script>
        <script>
                                                    // Função para abrir o modal de edição
                                                    function openEditModal(id, description, picture, amount, price, artists) {
                                                        document.getElementById("editModal").style.display = "block";

                                                        document.getElementById("edit-photocard-name").value = description;
                                                        document.getElementById("edit-photocard-url").value = picture;
                                                        document.getElementById("edit-photocard-units").value = amount;
                                                        document.getElementById("edit-photocard-price").value = price;
                                                        document.getElementById("edit_id").value = id;
                                                        document.getElementById("editPhotcardInput").src = picture;

                                                        // IDs dos artistas associados ao photocard específico
                                                        var associatedArtistIds = artists; // Supondo que você tenha esses IDs disponíveis

                                                        var checkboxes = document.getElementsByName("artists");

                                                        checkboxes.forEach(function (checkbox) {
                                                            // Se o ID do artista estiver na lista de IDs associados, marque o checkbox
                                                            if (associatedArtistIds.includes(parseInt(checkbox.value))) {
                                                                checkbox.checked = true;
                                                            } else {
                                                                checkbox.checked = false;
                                                            }
                                                        });
                                                    }
                                                    // Função para fechar o modal de edição
                                                    function closeEditModal() {
                                                        document.getElementById("editModal").style.display = "none";
                                                    }
                                                    // Adiciona um evento de mudança ao checkbox
                                                    document.getElementById('editIsIdol').addEventListener('change', function () {
                                                        // Obtém a referência ao elemento de seleção de grupo
                                                        var groupSelection = document.getElementById('editGroupSelection');
                                                        // Define a exibição do elemento de seleção de grupo com base no estado do checkbox
                                                        groupSelection.style.display = this.checked ? 'flex' : 'none';
                                                    });

                                                    function onUpdate() {
                                                        // Seleciona o formulário dentro do modal de edição
                                                        var form = document.querySelector("#editModal form");
                                                        form.action = '${pageContext.request.contextPath}/Admin/UpdatePhotocard';
                                                        form.submit();
                                                    }

                                                    function onDelete() {
                                                        var confirmed = confirm("Tem certeza que deseja excluir este artista?");
                                                        if (confirmed) {
                                                            // Seleciona o formulário dentro do modal de edição
                                                            var form = document.querySelector("#editModal form");
                                                            form.action = '${pageContext.request.contextPath}/Admin/DeletePhotocard';
                                                            form.submit();
                                                        } else {
                                                            alert("Exclusão cancelada");
                                                        }
                                                    }

                                                    // Filtrar por últimas unidades (menor ou igual a 4)
                                                    function filterLastUnits() {
                                                        let products = document.querySelectorAll('.photocard-card');
                                                        let btn = document.getElementById("lastUnits");
                                                        let applied = false;

                                                        products.forEach(product => {
                                                            let unitsElement = product.querySelector('.product-units');
                                                            let units = parseInt(unitsElement.textContent.split(' ')[0]); // Obtém o número de unidades
                                                            if (units <= 4) {
                                                                product.style.display = 'block'; // Mostra o produto se tiver 4 unidades ou menos
                                                            } else {
                                                                if (product.style.display === 'none') {
                                                                    product.style.display = 'block';
                                                                    applied = false;
                                                                } else {
                                                                    product.style.display = 'none';
                                                                    applied = true;
                                                                }
                                                            }
                                                        });

                                                        if (applied) // Correção no nome da propriedade style
                                                            btn.style.backgroundColor = "#E1B4F4";
                                                        else
                                                            btn.style.backgroundColor = "#6622CC";
                                                    }

                                                   
                                                    function filterPhotocardsBySearch(searchText) {
                                                        let photocards = document.querySelectorAll('.photocard-card');

                                                        // Iterar por todos os photocards
                                                        photocards.forEach(photocard => {
                                                            let description = photocard.querySelector('.product-title').textContent.toLowerCase();

                                                            // Verificar se o texto pesquisado está contido na descrição do photocards
                                                            if (description.toLowerCase().includes(searchText.toLowerCase())) {
                                                                photocard.style.display = 'block'; // Exibe o photocard se a descrição corresponder à pesquisa
                                                            } else {
                                                                photocard.style.display = 'none'; // Oculta o photocard se a descrição não corresponder à pesquisa
                                                            }
                                                        });
                                                    }



        </script>
    </body>

</html>
