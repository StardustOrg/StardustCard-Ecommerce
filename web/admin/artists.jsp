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
                        <!-- Single Product -->
                        <div class="artist-card">
                            <div class="artist-image">
                                <img src="./assets/bts.webp" />
                                <div class="overlay"></div>
                                <button onclick="myFunction()" class="edit"> Edit </button>
                                <div class="image-caption">
                                    BTS
                                </div>
                            </div>
                        </div>
                        <div class="artist-card">
                            <div class="artist-image">
                                <img src="./assets/newdjeans.webp" />
                                <div class="overlay"></div>
                                <button onclick="myFunction()" class="edit"> Edit </button>
                                <div class="image-caption">
                                    New Jeans
                                </div>
                            </div>
                        </div>
                        <div class="artist-card">
                            <div class="artist-image">
                                <img src="./assets/blackpink.jpg" />
                                <div class="overlay"></div>
                                <button onclick="myFunction()" class="edit"> Edit </button>
                                <div class="image-caption">
                                    Black Pink
                                </div>
                            </div>
                        </div>
                        <div class="artist-card">
                            <div class="artist-image">
                                <img src="./assets/txt.jpeg" />
                                <div class="overlay"></div>
                                <button onclick="myFunction()" class="edit"> Edit </button>
                                <div class="image-caption">
                                    TXT
                                </div>
                            </div>
                        </div>
                        <div class="artist-card">
                            <div class="artist-image">
                                <img src="./assets/bts.webp" />
                                <div class="overlay"></div>
                                <button onclick="myFunction()" class="edit"> Edit </button>
                                <div class="image-caption">
                                    BTS
                                </div>
                            </div>
                        </div>
                        <div class="artist-card">
                            <div class="artist-image">
                                <img src="./assets/newdjeans.webp" />
                                <div class="overlay"></div>
                                <button onclick="myFunction()" class="edit"> Edit </button>
                                <div class="image-caption">
                                    New Jeans
                                </div>
                            </div>
                        </div>
                        <div class="artist-card">
                            <div class="artist-image">
                                <img src="./assets/blackpink.jpg" />
                                <div class="overlay"></div>
                                <button onclick="myFunction()" class="edit"> Edit </button>
                                <div class="image-caption">
                                    Black Pink
                                </div>
                            </div>
                        </div>
                        <div class="artist-card">
                            <div class="artist-image">
                                <img src="./assets/txt.jpeg" />
                                <div class="overlay"></div>
                                <button onclick="myFunction()" class="edit"> Edit </button>
                                <div class="image-caption">
                                    TXT
                                </div>
                            </div>
                        </div>
                        <div class="artist-card">
                            <div class="artist-image">
                                <img src="./assets/bts.webp" />
                                <div class="overlay"></div>
                                <button onclick="myFunction()" class="edit"> Edit </button>
                                <div class="image-caption">
                                    BTS
                                </div>
                            </div>
                        </div>
                        <div class="artist-card">
                            <div class="artist-image">
                                <img src="./assets/newdjeans.webp" />
                                <div class="overlay"></div>
                                <button onclick="myFunction()" class="edit"> Edit </button>
                                <div class="image-caption">
                                    New Jeans
                                </div>
                            </div>
                        </div>
                        <div class="artist-card">
                            <div class="artist-image">
                                <img src="./assets/blackpink.jpg" />
                                <div class="overlay"></div>
                                <button onclick="myFunction()" class="edit"> Edit </button>
                                <div class="image-caption">
                                    Black Pink
                                </div>
                            </div>
                        </div>
                        <div class="artist-card">
                            <div class="artist-image">
                                <img src="./assets/txt.jpeg" />
                                <div class="overlay"></div>
                                <button onclick="myFunction()" class="edit"> Edit </button>
                                <div class="image-caption">
                                    TXT
                                </div>
                            </div>
                        </div>
                        <div class="artist-card">
                            <div class="artist-image">
                                <img src="./assets/bts.webp" />
                                <div class="overlay"></div>
                                <button onclick="myFunction()" class="edit"> Edit </button>
                                <div class="image-caption">
                                    BTS
                                </div>
                            </div>
                        </div>
                        <div class="artist-card">
                            <div class="artist-image">
                                <img src="./assets/newdjeans.webp" />
                                <div class="overlay"></div>
                                <button onclick="myFunction()" class="edit"> Edit </button>
                                <div class="image-caption">
                                    New Jeans
                                </div>
                            </div>
                        </div>
                        <div class="artist-card">
                            <div class="artist-image">
                                <img src="./assets/blackpink.jpg" />
                                <div class="overlay"></div>
                                <button onclick="myFunction()" class="edit"> Edit </button>
                                <div class="image-caption">
                                    Black Pink
                                </div>
                            </div>
                        </div>
                    </section>
                </div>
        </div>


    </main>
</div>

<script src="${pageContext.request.contextPath}/admin/main.js"></script>
</body>

</html>