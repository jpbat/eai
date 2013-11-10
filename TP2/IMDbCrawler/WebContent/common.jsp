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
						<form class="navbar-form pull-right">
							<input class="span2" type="text" placeholder="Username">
							<input class="span2" type="password" placeholder="Password">
							<button type="submit" class="btn btn-success">Sign in</button>
						</form>
						<div class="navbar-form pull-right">
							<button type="submit" class="btn btn-primary" onclick="loginFacebook(this)">Facebook</button>
							<strong style="padding-left:1em;padding-right:1em;color:white;">OR</strong>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="container">
			<% @include file="logged_out.jspf" %>
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
		<script src="//connect.facebook.net/en_US/all.js"></script>
		<script src="resources/assets/js/script.js"></script>
	</body>
</html>
