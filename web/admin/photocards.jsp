<%-- 
    Document   : photocards
    Created on : 8 de nov. de 2023, 20:50:08
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
        <%request.setAttribute("activePage", "photocards");%>
        <%@include file="./components/sidebar.jsp" %>
        <!-- Content Page -->
        <div class="content">
            <div class="message">
                <h1>Photocards</h1>
                <p>Let's see your product.</p>
            </div>
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
                            <section class="modal active hidden">
                                <div class="add-photocard-content">

                                    <div class="add-photocard-content-head">
                                        <button class="btn-close">fechar</button>
                                        <h3 class="modal-title">Add a new photocard</h3>
                                    </div>

                                    <div class="add-photocard-content-body">
                                        <div class="add-photocard-img">
                                            <div class="single-product">
                                                <div class="part-1">
                                                    <img src="" class="photocard-img" />
                                                </div>



                                            </div>
                                        </div>

                                        <div class="add-photocard-form">
                                            <form>
                                                <h4 class="photocard-input-title">Photocard name</h4>
                                                <input class="photocard-input" type="text" id="photocard-name"
                                                       placeholder="Photocard name" />

                                                <h4 class="photocard-input-title">Artist name</h4>
                                                <input class="photocard-input" type="text" id="artist-name"
                                                       placeholder="Photocard's artist name" />

                                                <div class="unit-price">
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
                        <div class="column-container">
                            <div class="single-product">
                                <div class="part-1">
                                    <button onclick="myFunction()" class="edit"> Edit </button>
                                    <img src="./assets/photocards/bts_7_rm.png" class="photocard-img" />
                                </div>
                                <div class="part-2">
                                    <h3 class="product-title">Photocard name</h3>
                                    <div class="part-2-2">
                                        <h5 class="product-units">5 units</h5>
                                        <button class="product-add-more">Add more</button>
                                    </div>

                                </div>
                            </div>
                        </div>
                        <div class="column-container">
                            <div class="single-product">
                                <div class="part-1">
                                    <button onclick="myFunction()" class="edit"> Edit </button>
                                    <img src="./assets/photocards/bts_7_suga.png" class="photocard-img" />
                                </div>
                                <div class="part-2">
                                    <h3 class="product-title">Photocard name</h3>
                                    <div class="part-2-2">
                                        <h5 class="product-units">5 units</h5>
                                        <button class="product-add-more">Add more</button>
                                    </div>

                                </div>
                            </div>
                        </div>
                        <div class="column-container">
                            <div class="single-product">
                                <div class="part-1">
                                    <button onclick="myFunction()" class="edit"> Edit </button>
                                    <img src="./assets/photocards/ive_love_dive_leeseo.png" class="photocard-img" />
                                </div>
                                <div class="part-2">
                                    <h3 class="product-title">Photocard name</h3>
                                    <div class="part-2-2">
                                        <h5 class="product-units">5 units</h5>
                                        <button class="product-add-more">Add more</button>
                                    </div>

                                </div>
                            </div>
                        </div>
                        <div class="column-container">
                            <div class="single-product">
                                <div class="part-1">
                                    <button onclick="myFunction()" class="edit"> Edit </button>
                                    <img src="./assets/photocards/bts_7_jhope.png" class="photocard-img" />
                                </div>
                                <div class="part-2">
                                    <h3 class="product-title">Photocard name</h3>
                                    <div class="part-2-2">
                                        <h5 class="product-units">5 units</h5>
                                        <button class="product-add-more">Add more</button>
                                    </div>

                                </div>
                            </div>
                        </div>
                        <div class="column-container">
                            <div class="single-product">
                                <div class="part-1">
                                    <button onclick="myFunction()" class="edit"> Edit </button>
                                    <img src="./assets/photocards/bts_7_rm.png" class="photocard-img" />
                                </div>
                                <div class="part-2">
                                    <h3 class="product-title">Photocard name</h3>
                                    <div class="part-2-2">
                                        <h5 class="product-units">5 units</h5>
                                        <button class="product-add-more">Add more</button>
                                    </div>

                                </div>
                            </div>
                        </div>
                        <div class="column-container">
                            <div class="single-product">
                                <div class="part-1">
                                    <button onclick="myFunction()" class="edit"> Edit </button>
                                    <img src="./assets/photocards/bts_7_suga.png" class="photocard-img" />
                                </div>
                                <div class="part-2">
                                    <h3 class="product-title">Photocard name</h3>
                                    <div class="part-2-2">
                                        <h5 class="product-units">5 units</h5>
                                        <button class="product-add-more">Add more</button>
                                    </div>

                                </div>
                            </div>
                        </div>
                        <div class="column-container">
                            <div class="single-product">
                                <div class="part-1">
                                    <button onclick="myFunction()" class="edit"> Edit </button>
                                    <img src="./assets/photocards/ive_love_dive_leeseo.png" class="photocard-img" />
                                </div>
                                <div class="part-2">
                                    <h3 class="product-title">Photocard name</h3>
                                    <div class="part-2-2">
                                        <h5 class="product-units">5 units</h5>
                                        <button class="product-add-more">Add more</button>
                                    </div>

                                </div>
                            </div>
                        </div>
                        <div class="column-container">
                            <div class="single-product">
                                <div class="part-1">
                                    <button onclick="myFunction()" class="edit"> Edit </button>
                                    <img src="./assets/photocards/bts_7_jhope.png" class="photocard-img" />
                                </div>
                                <div class="part-2">
                                    <h3 class="product-title">Photocard name</h3>
                                    <div class="part-2-2">
                                        <h5 class="product-units">5 units</h5>
                                        <button class="product-add-more">Add more</button>
                                    </div>

                                </div>
                            </div>
                        </div>
                        <div class="column-container">
                            <div class="single-product">
                                <div class="part-1">
                                    <button onclick="myFunction()" class="edit"> Edit </button>
                                    <img src="./assets/photocards/bts_7_rm.png" class="photocard-img" />
                                </div>
                                <div class="part-2">
                                    <h3 class="product-title">Photocard name</h3>
                                    <div class="part-2-2">
                                        <h5 class="product-units">5 units</h5>
                                        <button class="product-add-more">Add more</button>
                                    </div>

                                </div>
                            </div>
                        </div>
                        <div class="column-container">
                            <div class="single-product">
                                <div class="part-1">
                                    <button onclick="myFunction()" class="edit"> Edit </button>
                                    <img src="./assets/photocards/bts_7_suga.png" class="photocard-img" />
                                </div>
                                <div class="part-2">
                                    <h3 class="product-title">Photocard name</h3>
                                    <div class="part-2-2">
                                        <h5 class="product-units">5 units</h5>
                                        <button class="product-add-more">Add more</button>
                                    </div>

                                </div>
                            </div>
                        </div>
                        <div class="column-container">
                            <div class="single-product">
                                <div class="part-1">
                                    <button onclick="myFunction()" class="edit"> Edit </button>
                                    <img src="./assets/photocards/ive_love_dive_leeseo.png" class="photocard-img" />
                                </div>
                                <div class="part-2">
                                    <h3 class="product-title">Photocard name</h3>
                                    <div class="part-2-2">
                                        <h5 class="product-units">5 units</h5>
                                        <button class="product-add-more">Add more</button>
                                    </div>

                                </div>
                            </div>
                        </div>
                        <div class="column-container">
                            <div class="single-product">
                                <div class="part-1">
                                    <button onclick="myFunction()" class="edit"> Edit </button>
                                    <img src="./assets/photocards/bts_7_rm.png" class="photocard-img" />
                                </div>
                                <div class="part-2">
                                    <h3 class="product-title">Photocard name</h3>
                                    <div class="part-2-2">
                                        <h5 class="product-units">5 units</h5>
                                        <button class="product-add-more">Add more</button>
                                    </div>

                                </div>
                            </div>
                        </div>
                        <div class="column-container">
                            <div class="single-product">
                                <div class="part-1">
                                    <button onclick="myFunction()" class="edit"> Edit </button>
                                    <img src="./assets/photocards/bts_7_suga.png" class="photocard-img" />
                                </div>
                                <div class="part-2">
                                    <h3 class="product-title">Photocard name</h3>
                                    <div class="part-2-2">
                                        <h5 class="product-units">5 units</h5>
                                        <button class="product-add-more">Add more</button>
                                    </div>

                                </div>
                            </div>
                        </div>
                        <div class="column-container">
                            <div class="single-product">
                                <div class="part-1">
                                    <button onclick="myFunction()" class="edit"> Edit </button>
                                    <img src="./assets/photocards/bts_7_rm.png" class="photocard-img" />
                                </div>
                                <div class="part-2">
                                    <h3 class="product-title">Photocard name</h3>
                                    <div class="part-2-2">
                                        <h5 class="product-units">5 units</h5>
                                        <button class="product-add-more">Add more</button>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </section>
                </div>
            </main>
        </div>

        <script src="${pageContext.request.contextPath}/admin/main.js"></script>
    </body>

</html>