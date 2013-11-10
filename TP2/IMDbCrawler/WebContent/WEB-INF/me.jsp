<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<title>IMDb Crawler</title>

		<!-- Le styles -->
		<link href="resources/assets/css/bootstrap.css" rel="stylesheet">
		<link href="resources/assets/css/bootstrap-responsive.css" rel="stylesheet">
		<link href="resources/assets/css/style.css" rel="stylesheet">
		<link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/css?family=Ubuntu:regular,bold&subset=Latin">

		<!-- Favicon -->
		<link rel="shortcut icon" href="resources/assets/ico/favicon.png">
	</head>

	<body>
		<div class="navbar navbar-inverse navbar-fixed-top">
			<div class="navbar-inner">
				<div class="container">
					<button type="button" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<a class="brand" href="http://www.imdb.com"><img src="resources/assets/img/logo.png" alt="IMDb Logo" style="height: 25px;"/></a>
					<div class="nav-collapse collapse">
						<div class="navbar-form pull-right">
							<!-- CHANGED -->
							<img src="http://gravatar.com/avatar/5dba588d2d4d2a52c0b6e20eac705cc5?s=40" style="border-radius: 8px;">
							<a href="./me.jsp" style="padding-left: 8px;"><strong>João Ferreira</strong></a>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="container">
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
					<h2>My Best Movie <a class="btn btn-primary pull-right" href="./index.jsp">Back</a></h2>
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
		</div>

		<!-- Le javascript
		================================================== -->
		<!-- Placed at the end of the document so the pages load faster -->
		<script src="resources/assets/js/jquery.min.js"></script>
		<script src="resources/assets/js/bootstrap-transition.js"></script>
		<script src="resources/assets/js/bootstrap-alert.js"></script>
		<script src="resources/assets/js/bootstrap-modal.js"></script>
		<script src="resources/assets/js/bootstrap-dropdown.js"></script>
		<script src="resources/assets/js/bootstrap-scrollspy.js"></script>
		<script src="resources/assets/js/bootstrap-tab.js"></script>
		<script src="resources/assets/js/bootstrap-tooltip.js"></script>
		<script src="resources/assets/js/bootstrap-popover.js"></script>
		<script src="resources/assets/js/bootstrap-button.js"></script>
		<script src="resources/assets/js/bootstrap-collapse.js"></script>
		<script src="resources/assets/js/bootstrap-carousel.js"></script>
		<script src="resources/assets/js/bootstrap-typeahead.js"></script>
		<script src="resources/assets/js/script.js"></script>
	</body>
</html>
