<%@include file="header.jsp" %>	
	<div class="row">
		<div class="span3">
			<h2 style="padding-bottom: 15px;"><a onclick="editFavorites()">My Favorites</a></h2>
			<div class="hero-unit" style="padding-top:1em;">
				<ul>
					<li>Action</li>
					<li>Adult</li>
					<li>Crime</li>
					<li>Drama</li>
				</ul>
			</div>
		</div>
		<div class="span9">
			<h2>My Best Movie <a class="btn btn-primary pull-right" href="./">Back</a></h2>
			<div id="movieList" style="padding-top:1em;">
				<table>
					<tr>
						<th>
							<h1>Thor: The Dark World</h1>
						</th>
					</tr>
					<tr>
						<td>
							<div class="movie row-fluid">
								<div class="span3" style="text-align: center; padding-top:5%;">
									<img src="http://ia.media-imdb.com/images/M/MV5BMTQyNzAwOTUxOF5BMl5BanBnXkFtZTcwMTE0OTc5OQ@@._V1_SY317_CR4,0,214,317_.jpg" alt="Movie Poster" style="height: 250px;">
								</div>
								<div class="span9" style="padding-right:10px; padding-top:20px;">
									<strong>Score: </strong>7.6/10<br>
									<strong>Duration: </strong>112 min<br>
									<strong>Genres: </strong>Action, Adventure, Fantasy<br>
									<strong>Stars: </strong>Chris Hemsworth, Natalie Portman, Tom Hiddleston<br>
									<strong>Director: </strong>Alan Taylor<br>
									<strong>Launch Date: </strong>8 November 2013 (USA)<br>
									<hr>
									<strong>Description:</strong>
									<div>
										Thousands of years ago, a race of beings known as Dark Elves tried to send the universe into darkness by using a weapon known as the Aether. But warriors from Asgard stop them but their leader Malekith escapes to wait for another opportunity. The warriors find the Aether and since it can't be destroyed, they try to hide it. In the present day, Jane Foster awaits the return of Thor but it's been two years. He's trying to bring peace to the nine realms. Jane discovers an anomaly similar to the one that brought Thor to Earth. She goes to investigate and finds a wormhole and is sucked into it. Thor wishes to return to Earth but his father, Odin refuses to let him. Thor learns from Heimdall, the one who can see into all of the realms that Jane disappeared. Thor then returns to Earth just as Jane returns. But when some policemen try to arrest her, some kind of energy repulses them. Thor then brings her to Asgard to find out what happened to Earth. When it happens again, they discovered that... Written by rcs0411@yahoo.com
									</div>
								</div>
							</div>
						</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
</div>

<!-- Modals -->
<div id="selectFavorites" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
		<h3 id="myModalLabel">Edit Favorite Categories</h3>
	</div>
	<div class="modal-body">
		<form id="selectFavoritesForm" method="post">
			<div class="row-fluid">
				<div class="span3"></div>
				<div class="span6">
					<input type="checkbox"> <strong>A</strong><br>
					<input type="checkbox"> <strong>B</strong><br>
					<input type="checkbox"> <strong>C</strong><br>
				</div>
				<div class="span3"></div>
			</div>
		</form>
	</div>
	<div class="modal-footer">
		<button class="btn" data-dismiss="modal" aria-hidden="true">Cancel</button>
		<button class="btn btn-primary" onclick="submitCategoriesFilter()">Submit!</button>
	</div>
<%@include file="footer.jsp" %>	