<%@include file="header.jsp" %>	
<div class="row">
		<div class="span2">
			<a href="#" class="btn btn-primary">Sort By Name</a>
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
			<tr>
				<th>
					<h1>Thor: The Dark World</h1>
				</th>
			</tr>
			<tr>
				<td>
					<div class="movie row-fluid">
						<div class="span2" style="text-align: center; padding-top:2em;">
							<img src="http://ia.media-imdb.com/images/M/MV5BMTQyNzAwOTUxOF5BMl5BanBnXkFtZTcwMTE0OTc5OQ@@._V1_SY317_CR4,0,214,317_.jpg" alt="Movie Poster" style="height: 250px;">
						</div>
						<div class="span10" style="padding-right:10px; padding-top:20px;">
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

<!-- Modals -->
<div id="scoreFilter" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
		<h3 id="myModalLabel">Filter by Score</h3>
	</div>
	<div class="modal-body">
		<form id="scoreFilterForm" method="post" action="index">
			<div class="row-fluid">
				<input type="hidden" name="type" value="scoreFilter">
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
		<button class="btn" data-dismiss="modal" aria-hidden="true">Cancel</button>
		<button class="btn btn-primary" onclick="submitScoreFilter()">Submit!</button>
	</div>
</div>

<div id="categoryFilter" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
		<h3 id="myModalLabel">Filter by Category</h3>
	</div>
	<div class="modal-body">
		<form id="scoreCategoriesForm" method="post" action="index">
			<input type="hidden" name="type" value="categoriesFilter">
			<div class="row-fluid">
				<div class="span3"></div>
				<div class="span6">
					<input value="a" name="category" type="checkbox"> A<br>
					<input value="b" name="category" type="checkbox"> B<br>
					<input value="c" name="category" type="checkbox"> C<br>
				</div>
				<div class="span3"></div>
			</div>
		</form>
	</div>
	<div class="modal-footer">
		<button class="btn" data-dismiss="modal" aria-hidden="true">Cancel</button>
		<button class="btn btn-primary" onclick="submitCategoriesFilter()">GO!</button>
	</div>
<%@include file="footer.jsp" %>