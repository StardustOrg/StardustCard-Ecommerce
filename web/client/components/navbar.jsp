<div class="navbar">
    <% String activePage = (String) request.getAttribute("activePage"); %>
    <div class="logo">StardustCard</div>
    <ul class="navbar_pages">
        <li><a href="Home" class=<%= activePage.equals("home") ? "active" : "" %>>Home</a></li>
        <li><a class=<%= activePage.equals("artists") ? "active" : "" %>>Artists</a></li>
        <li><a class=<%= activePage.equals("trending") ? "active" : "" %>>Trending</a></li>
        <li><a class=<%= activePage.equals("newadditions") ? "active" : "" %>>New additions</a></li>
    </ul>
    <div class="navbar_actions">
        <div id="search">
            <span class="material-symbols-rounded">
                search
            </span>
        </div>
        <div id="cart">
            <a>
                <span class="material-symbols-rounded">
                    shopping_cart
                </span>
            </a>
        </div>
        <div class="dropdown-account not-logged">
            <span class="material-symbols-rounded">
                person
            </span>
            <div class="dropdown-content">
                <a href="Login">
                    <button>Sign in</button>
                </a>
                <div class="new-account-div">
                    <p>New here?</p>
                    <a href="Register">Create Account</a>
                </div>
            </div>
        </div>
    </div>
</div>