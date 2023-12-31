<%@page import="model.user.User"%>
<div class="navbar">
    <% String activePage = (String) request.getAttribute("activePage");
        User myUser = (User) request.getAttribute("user");
        int totalCart = (int) request.getAttribute("totalCart");
    %>
    <a href="${pageContext.request.contextPath}/Home"><div class="logo">StardustCard</div></a>
    <ul class="navbar_pages">
        <li><a href="${pageContext.request.contextPath}/Home" class=<%= activePage.equals("home") ? "active" : ""%>>Home</a></li>
        <li><a href="${pageContext.request.contextPath}/Artists" class=<%= activePage.equals("artists") ? "active" : ""%>>Artists</a></li>
        <li><a class=<%= activePage.equals("trending") ? "active" : ""%>>Trending</a></li>
        <li><a class=<%= activePage.equals("newadditions") ? "active" : ""%>>New additions</a></li>
    </ul>
    <div class="navbar_actions">
        <div id="search">
            <span class="material-symbols-rounded">
                search
            </span>
        </div>
        <div id="cart">
            <a href="${pageContext.request.contextPath}/Cart">
                <span class="material-symbols-rounded">
                    shopping_cart
                </span>
                <span class="shopping-cart-value"><%= totalCart%></span>
            </a>
        </div>
        <% if (myUser == null) { %> 
        <div class="not-logged dropdown-account">
            <span class="material-symbols-rounded">
                person
            </span>
            <div class="dropdown-content">
                <a href="${pageContext.request.contextPath}/Login">
                    <button>Sign in</button>
                </a>
                <div class="new-account-div">
                    <p>New here?</p>
                    <a href="${pageContext.request.contextPath}/Register">Create Account</a>
                </div>
            </div>
            <% } else {
            %>
            <div class="logged dropdown-account">
                <span class="material-symbols-rounded">
                    person
                </span>
                <div class="dropdown-content">
                    <a href="${pageContext.request.contextPath}/Profile">Your Profile</a>
                    <a href="${pageContext.request.contextPath}/Orders">Your Orders</a>
                    <a href="${pageContext.request.contextPath}/LogOut" class="logout">Log Out</a>
                </div>
                <% }
                %>
            </div>
        </div>
    </div>