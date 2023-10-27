<%@page import="model.artist.Artist"%>
<%
    String pageURL = (String)request.getAttribute("pageURL");
    Artist artist = (Artist)request.getAttribute("artist");
%>
<a href="Artists/<%= artist.getName()%>">
    <div class="artist-card">
        <div class="artist-image">
            <img src="<%= artist.getIcon()%>" />
            <div class="overlay"></div>
            <div class="image-caption">
                <%= artist.getName()%>
            </div>
        </div>
    </div>
</a>