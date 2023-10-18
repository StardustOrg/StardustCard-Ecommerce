<%-- 
    Document   : home.jsp
    Created on : 14 de out. de 2023, 14:18:18
    Author     : joaov
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <% request.setAttribute("pageTitle", "StardustCard - Home");%>
    <%@include file="./components/head.jsp" %>

    <body>
        <div class="container">
            <% request.setAttribute("activePage", "home");%>
            <%@include file="./components/navbar.jsp" %>
        </div>
        <div class="slideshow">
            <div class="slideshow-container">
                <div class="slide fade">
                    <div class="slide_text">
                        <div class="slide_title">Find your next photocard here</div>
                        <div class="slide_subtitle">Rare photocards available only on StardustCard!</div>
                        <div class="slider-dots">
                            <span class="dot" id="active-dot" onclick="currentSlide(1)"></span>
                            <span class="dot" onclick="currentSlide(2)"></span>
                            <span class="dot" onclick="currentSlide(3)"></span>
                        </div>
                    </div>
                    <img src="../assets/slide/slide_img_1.png" class="slide_img">
                </div>
                <div class="slide fade">
                    <div class="slide_text">
                        <div class="slide_title">New additions every week</div>
                        <div class="slide_subtitle">All new releases available!</div>
                        <div class="slider-dots">
                            <span class="dot" onclick="currentSlide(1)"></span>
                            <span class="dot" id="active-dot" onclick="currentSlide(2)"></span>
                            <span class="dot" onclick="currentSlide(3)"></span>
                        </div>
                    </div>
                    <img src="../assets/slide/slide_img_2.png" class="slide_img">
                </div>
                <div class="slide fade">
                    <div class="slide_text">
                        <div class="slide_title">All your favorite idols</div>
                        <div class="slide_subtitle">The widest range of artists!</div>
                        <div class="slider-dots">
                            <span class="dot" onclick="currentSlide(1)"></span>
                            <span class="dot" onclick="currentSlide(2)"></span>
                            <span class="dot" id="active-dot" onclick="currentSlide(3)"></span>
                        </div>
                    </div>
                    <img src="../assets/slide/slide_img_3.png" class="slide_img">
                </div>
            </div>
        </div>

        <div class="container" id="body">
            <div class="bundles" id="artists">
                <h2>artists</h2>
                <div class="carrousel-container">
                    <span class="material-symbols-rounded" onclick="moveCarousel(-1)">
                        arrow_back_ios_new
                    </span>
                    <div class="carrousel">
                        <a href="newjeans_page.html">
                            <div class="artist-card">
                                <div class="artist-image">
                                    <img src="../assets/idols/newjeans.jpg" />
                                    <div class="overlay"></div>
                                    <div class="image-caption">
                                        NEWJEANS
                                    </div>
                                </div>
                            </div>
                        </a>
                        <div class="artist-card">
                            <div class="artist-image">
                                <img src="../assets/idols/redvelvet.png" />
                                <div class="overlay"></div>
                                <div class="image-caption">
                                    red velvet
                                </div>
                            </div>
                        </div>
                        <div class="artist-card">
                            <div class="artist-image">
                                <img src="../assets/idols/bts.jpg" />
                                <div class="overlay"></div>
                                <div class="image-caption">
                                    bts
                                </div>
                            </div>
                        </div>
                        <div class="artist-card">
                            <div class="artist-image">
                                <img src="../assets/idols/twice.jpg" />
                                <div class="overlay"></div>
                                <div class="image-caption">
                                    twice
                                </div>
                            </div>
                        </div>
                        <div class="artist-card">
                            <div class="artist-image">
                                <img src="../assets/idols/txt.jpg" />
                                <div class="overlay"></div>
                                <div class="image-caption">
                                    txt
                                </div>
                            </div>
                        </div>
                        <a href="iu_page.html">
                            <div class="artist-card">
                                <div class="artist-image">
                                    <img src="../assets/idols/iu.jpg" />
                                    <div class="overlay"></div>
                                    <div class="image-caption">
                                        iu
                                    </div>
                                </div>
                            </div>
                        </a>
                        <div class="artist-card">
                            <div class="artist-image">
                                <img src="../assets/idols/lesserafim.jpg" />
                                <div class="overlay"></div>
                                <div class="image-caption">
                                    le sserafim
                                </div>
                            </div>
                        </div>
                        <div class="artist-card">
                            <div class="artist-image">
                                <img src="../assets/idols/seventeen.jpg" />
                                <div class="overlay"></div>
                                <div class="image-caption">
                                    seventeen
                                </div>
                            </div>
                        </div>
                        <div class="artist-card">
                            <div class="artist-image">
                                <img src="../assets/idols/ive.jpg" />
                                <div class="overlay"></div>
                                <div class="image-caption">
                                    ive
                                </div>
                            </div>
                        </div>
                        <div class="artist-card">
                            <div class="artist-image">
                                <img src="../assets/idols/aespa.jpg" />
                                <div class="overlay"></div>
                                <div class="image-caption">
                                    aespa
                                </div>
                            </div>
                        </div>
                        <div class="artist-card">
                            <div class="artist-image">
                                <img src="../assets/idols/bp.jpg" />
                                <div class="overlay"></div>
                                <div class="image-caption">
                                    blackpink
                                </div>
                            </div>
                        </div>
                        <div class="artist-card">
                            <div class="artist-image">
                                <img src="../assets/idols/itzy.png" />
                                <div class="overlay"></div>
                                <div class="image-caption">
                                    itzy
                                </div>
                            </div>
                        </div>
                    </div>
                    <span class="material-symbols-rounded" onclick="moveCarousel(1)">
                        arrow_forward_ios
                    </span>
                </div>
            </div>
            <div class="bundles" id="last-units">
                <h2>last units</h2>
                <div class="photocards">
                    <div class="card">
                        <div id="photo">
                            <img src="../assets/photocard/bts_proof_rm.png" alt="Avatar">
                        </div>
                        <div class="card-title">BTS Proof RM Photocard</div>
                        <div class="card-detail">5 units left</div>
                    </div>
                    <div class="card">
                        <div id="photo">
                            <img src="../assets/photocard/hannie_bunnie_tokkis.png" alt="Avatar">
                        </div>
                        <div class="card-title">Official New Jeans Lightstick Photocards / Bunnies Tokkis</div>
                        <div class="card-detail">4 units left</div>
                    </div>
                    <div class="card">
                        <div id="photo">
                            <img src="../assets/photocard/ive_love_dive_wooyoung.png" alt="Avatar">
                        </div>
                        <div class="card-title">IVE Love Dive Wooyoung</div>
                        <div class="card-detail">1 units left</div>
                    </div>
                    <div class="card">
                        <div id="photo">
                            <img src="../assets/photocard/bp_ice_cream_jennie.png" alt="Avatar">
                        </div>
                        <div class="card-title">Ice Cream Physical Release Jennie</div>
                        <div class="card-detail">5 units left</div>
                    </div>
                    <div class="card">
                        <div id="photo">
                            <img src="../assets/photocard/txt_blue_hour_kai.png" alt="Avatar">
                        </div>
                        <div class="card-title">Blue Hour Version 01 Hueningkai</div>
                        <div class="card-detail">3 units left</div>
                    </div>
                </div>
            </div>
            <div class="bundles" id="new-additions">
                <h2>new additions</h2>
                <div class="photocards">
                    <div class="card">
                        <div id="photo">
                            <img src="../assets/photocard/twice_alchool_free_nayeon.png" alt="Avatar">
                        </div>
                        <div class="card-title">Taste of Love Version 03 Nayeon</div>
                    </div>
                    <div class="card">
                        <div id="photo">
                            <img src="../assets/photocard/attacca_the_8.png" alt="Avatar">
                        </div>
                        <div class="card-title">Attacca 9th Mini Album Op 1 The8</div>
                    </div>
                    <a href="product_page.html">
                        <div class="card">
                            <div id="photo">
                                <img src="../assets/photocard/hanni_bunnyland.png" alt="Avatar">
                            </div>
                            <div class="card-title">NewJeans Photocard 'Bunnyland' Version</div>
                        </div>
                    </a>
                    <div class="card">
                        <div id="photo">
                            <img src="../assets/photocard/attacca_the_8.png" alt="Avatar">
                        </div>
                        <div class="card-title">Attacca 9th Mini Album Op 1 The8</div>
                    </div>
                    <div class="card">
                        <div id="photo">
                            <img src="../assets/photocard/attacca_the_8.png" alt="Avatar">
                        </div>
                        <div class="card-title">Attacca 9th Mini Album Op 1 The8</div>
                    </div>
                </div>
            </div>
        </div>

        <footer>
            <div class="container" id="footer">
                <div class="footer-column">
                    <h3>Contact Us</h3>
                    <p>contact@stardustcard.org</p>
                    <div class="logo">StardustCard</div>
                    <p>© 2023, StardustCard</p>
                </div>
                <div class="footer-column">
                    <h3>Quick links</h3>
                    <p class="links">Terms of Service</p>
                    <p class="links">Privacy Policy</p>
                    <p class="links">Refund Policy</p>
                </div>
                <div class="footer-column">
                    <h3>Our mission</h3>
                    <p>We offer only the best and highest quality products of
                        your favorite idols.</p>
                    <p>A touch of Stardust</p>
                </div>
            </div>
        </footer>
        <script src="${pageContext.request.contextPath}/client/script.js"></script>
    </body>

</html>
