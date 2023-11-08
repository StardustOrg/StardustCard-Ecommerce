<%-- 
    Document   : profile_page
    Created on : 8 de nov. de 2023, 15:35:19
    Author     : Yanna
--%>
<%@page import="model.user.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <% request.setAttribute("pageTitle", "StardustCard - Profile");%>
    <%@include file="./components/head.jsp" %>
    <body>
        <div class="container" id="body">
            <% request.setAttribute("activePage", "profile");
            %>
            <%@include file="./components/navbar.jsp" %>
            <h2 class="profile-heading">My Profile</h2>
            <div class="profile-container">
                <div class="profile-options-cont">
                    <a href="Profile">
                        <div class="selected profile-option">
                            <span class="material-symbols-rounded">
                                account_circle
                            </span>
                            My Details
                        </div>
                    </a>
                    <a>
                        <div class="profile-option">
                            <span class="material-symbols-rounded">
                                orders
                            </span>
                            My Orders
                        </div>
                    </a>
                </div>
                <div class="profile-info-cont">
                    <h3>Your information</h3>
                    <div class="info-row">
                        <div class="info-subt">
                            <p>This is your personal information. If you want to update, change the specific value and the
                                save it.</p>
                            <a id="delete-account">DELETE ACCOUNT</a>
                        </div>
                        <div class="details-form">
                            <form method="post">
                                <label>Your Name:</label>
                                <input type="text" name="name" id="name" placeholder="First and last name" value="<%= myUser.getName() %>" required>
                                <label>Address:</label>
                                <input type="text" name="address" id="address" placeholder="Your address" value="<%= myUser.getAddress()%>" required>
                                <label>Email:</label>
                                <input type="email" name="email" id="email" placeholder="Your email" value="<%= myUser.getEmail()%>" required>
                                <button>Save</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div> 
        </div>
    </body>
</html>
