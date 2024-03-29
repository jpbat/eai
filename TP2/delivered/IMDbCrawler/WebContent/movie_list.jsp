<%@page import="java.util.List"%>
<%@page import="models.Director"%>
<%@page import="models.Actor"%>
<%@page import="models.Genre"%>
<%@page import="models.Movie"%>
<%@page import="java.util.ArrayList"%>

<div class="row">
		<div class="span2">
			<a href="?sort=Title" class="btn btn-primary">Sort By Name</a>
		</div>
		<div class="span2">
			<button class="btn btn-primary" onclick="scoreFilter()">Filter By Score</button>
		</div>
		<div class="span2">
			<button class="btn btn-primary" onclick="categoryFilter()">Filter By Category</button>
		</div>
	</div>

	<div id="movieList" style="padding-top:1em;">

		<table>
	<%
		List<Movie> movies= (List<Movie>)request.getAttribute("movieLst");
		if(movies!=null)
		for(Movie movie : movies){
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

<script type="text/javascript">
	$(function () {
		if ($('#movieList tr').size() == 0) {
			$('#movieList').html('<h3>No movies to be shown :(</h3>')
		}
	});
	$(function () {
		if ($('[name="category"]').size() == 0) {
			$('#scoreCategoriesForm').html('<h3>No categories to be shown :(</h3>');
		}
	});
</script>

<!-- Modals -->
<div id="scoreFilter" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">x</button>
		<h3 id="myModalLabel">Filter by Score</h3>
	</div>
	<div class="modal-body">
		<form id="scoreFilterForm" method="post" action="index">
			<input type="hidden" name="type" value="scoreFilter">
			<div class="row-fluid">
				<div class="span3">
					<input type="radio" name="score" value="bigger"> Bigger then:
				</div>
				<div class="span3">
					<input class="value" name="valueBigger"> 
				</div>
			</div>
			<div class="row-fluid">
				<div class="span3">
					<input type="radio" name="score" value="less"> Less then:
				</div>
				<div class="span3">
					<input class="value" name="valueLess"> 
				</div>
			</div>
			<div class="row-fluid">
				<div class="span3">
					<input type="radio" name="score" value="between"> Between:
				</div>
				<div class="span2">
					<input class="value" name="valueBetweenSmaller"> 
				</div>
				<div class="span1">
					and
				</div>
				<div class="span1">
					<input class="value" name="valueBetweenBigger"> 
				</div>
			</div>
		</form>
	</div>
	<div class="modal-footer">
		<button class="btn btn-mini" data-dismiss="modal" aria-hidden="true">Cancel</button>
		<button class="btn btn-primary btn-mini" onclick="submitScoreFilter()">Submit!</button>
	</div>
</div>

<div id="categoryFilter" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">x</button>
		<h3 id="myModalLabel">Filter by Category</h3>
	</div>
	<div class="modal-body">
		<form id="scoreCategoriesForm" method="post" action="index">
			<input type="hidden" name="type" value="categoriesFilter">
			<div class="row-fluid">
				<div class="span1"></div>
				<div class="span4">
					<%
						List<Genre> genres= (List<Genre>)request.getAttribute("genreLst");
							if(genres != null)
								for(int i = 0; i < genres.size(); i++) {
									if (i % 2 == 0) {
										Genre genre = genres.get(i);
										%><input value="<%=genre.getID() %>" name="category" type="checkbox"> <strong><%=genre.getName() %></strong><br><%
									}
								}
					%>
				</div>
				<div class="span2"></div>
				<div class="span4">
					<%
							if(genres != null)
								for(int i = 0; i < genres.size(); i++) {
									if (i % 2 == 1) {
										Genre genre = genres.get(i);
										%><input value="<%=genre.getID() %>" name="category" type="checkbox"> <strong><%=genre.getName() %></strong><br><%
								}
							}
					%>
				</div>
				<div class="span1"></div>
			</div>
		</form>
	</div>
	<div class="modal-footer">
		<button class="btn btn-small" data-dismiss="modal" aria-hidden="true">Cancel</button>
		<button class="btn btn-primary btn-small" onclick="submitCategoriesFilter()">GO!</button>
		<button class="btn btn-info btn-small pull-left" onclick="checkNone()">Clear</button>
		<button class="btn btn-warning btn-small pull-left" onclick="checkAll()">All</button>
	</div>