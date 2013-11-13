<%@page import="models.Genre"%>
<%@page import="java.util.List"%>
<%@page import="models.Director"%>
<%@page import="models.Actor"%>
<%@page import="models.Genre"%>
<%@page import="models.Movie"%>
<%@page import="java.util.ArrayList"%>

<%@include file="header.jsp" %>
	<div class="row">
		<div class="span3">
			<h2 style="padding-bottom: 15px;"><a onclick="editFavorites()">My Favorites</a></h2>
			<div class="hero-unit" style="padding-top:1em;">
				<ul id="favs">
					<%
					List<Genre> myGenres= (List<Genre>)request.getAttribute("myGenreLst");
					if(myGenres!=null)
						for(Genre genre : myGenres) {
					%>
					<li id='<%=genre.getID() %>'><strong><%=genre.getName() %></strong></li>

					<%
					}
					%>				
				</ul>
			</div>
		</div>
		<div class="span9">
			<h2>My Best Movie <a class="btn btn-primary pull-right" href="index">Back</a></h2>
			<div id="movieList" style="padding-top:1em;">
			<table>
	<%
		List<Movie> movies= (List<Movie>)request.getAttribute("movieLst");
		if(movies != null && movies.isEmpty() == false) {
			Movie movie = movies.get(0);
			String genres = new String();
			String actors = new String();
			String directors = new String();
			
			for(Genre genre:movie.getGenres()){
				genres+=genre.getName()+", ";
			}
			if(!genres.isEmpty()){
				genres = genres.substring(0, genres.length()-2);
			}

			for(Actor actor:movie.getActors()){
				actors+=actor.getName()+", ";
			}
			if(!genres.isEmpty()){
				actors = actors.substring(0, actors.length()-2);
			}			
			
			for(Director director:movie.getDirectors()){
				directors+=director.getName()+", ";
			}
			if(!directors.isEmpty()){
				directors = directors.substring(0, directors.length()-2);
			}
			
			%>
			<tr>
				<th>
					<h1><%= movie.getTitle() %></h1>
				</th>
			</tr>
			<tr>
				<td>
					<div class="movie row-fluid">
						<div class="span2" style="text-align: center; padding-top:2em;">
							<img src="<%= movie.getImage() %>" alt="Movie Poster" style="height: 250px;">
						</div>
						<div class="span10" style="padding-right:10px; padding-top:20px;">
							<%
								if (movie.getMetascore() == -1) { %>
									<strong>Score: </strong> unavailable <br>	
								<% } else { %>
									<strong>Score: </strong><%=movie.getMetascore()%>/10<br>
								<%}
							%>
							<%
								if (movie.getDuration().length() == 0) { %>
									<strong>Duration: </strong> unavailable <br>	
								<% } else { %>
									<strong>Duration: </strong><%=movie.getDuration()%><br>
								<%}
							%>
							<strong>Genres: </strong><%=genres%><br>
							<strong>Stars: </strong><%=actors%><br>
							<strong>Director: </strong><%=directors%><br>
							<strong>Launch Date: </strong><%=movie.getLaunchDate()%><br>
							<hr>
							<strong>Description:</strong>
							<div>
								<%= movie.getDescription() %>
							</div>
						</div>
					</div>
				</td>
			</tr>
			<% } %>
		</table>
			</div>
		</div>
	</div>
</div>
<script>
	$(function() {
		var favs = $('#favs li');
		for (var i = 0; i < favs.length; i++) {
			$("[value='" + favs[i].getAttribute('id') + "']").attr('checked','checked');
		}
	});
</script>

<!-- Modals -->
<div id="selectFavorites" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">x</button>
		<h3 id="myModalLabel">Edit Favorite Categories</h3>
	</div>
	<div class="modal-body">
		<form id="selectFavoritesForm" method="post" action="me">
			<div class="row-fluid">
				<div class="span3"></div>
				<div class="span6">
									<%
					List<Genre> genres= (List<Genre>)request.getAttribute("genreLst");
					if (genres != null)
						for(Genre genre : genres) {
							%><input value="<%=genre.getID() %>" name="category" type="checkbox"> <strong><%=genre.getName() %></strong><br><%
						}
					%>
				</div>
				<div class="span3"></div>
			</div>
		</form>
	</div>
	<div class="modal-footer">
		<button class="btn" data-dismiss="modal" aria-hidden="true">Cancel</button>
		<button class="btn btn-primary" onclick="submitFavoritesFilter()">Submit!</button>
	</div>
<%@include file="footer.jsp" %>	