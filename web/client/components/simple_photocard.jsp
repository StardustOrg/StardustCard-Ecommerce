<%
    String cardTitle = (String)request.getAttribute("cardTitle");
    String imageUrl = (String)request.getAttribute("imageUrl");
%>

<div class="card">
    <div id="photo">
        <img src="<%= request.getContextPath() %>/<%= imageUrl %>">
    </div>
    <div class="card-title"><%= cardTitle %></div>
</div>