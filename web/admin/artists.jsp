<%-- 
    Document   : artists
    Created on : 8 de nov. de 2023, 20:50:19
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
        <%request.setAttribute("activePage", "artists");%>
        <%@include file="./components/sidebar.jsp" %>
        <!-- Content Page -->
        <div class="content">
            <div class="message">
                <h1>Artists</h1>
                <p>Let's see your artists.</p>
            </div>
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