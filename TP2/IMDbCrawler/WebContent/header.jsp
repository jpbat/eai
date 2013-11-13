<%@page import="services.AccountService"%>

<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<title>IMDb Crawler</title>

		<!-- Le styles -->
		<link href="assets/css/bootstrap.css" rel="stylesheet">
		<link href="assets/css/bootstrap-responsive.css" rel="stylesheet">
		<link href="assets/css/style.css" rel="stylesheet">
		<link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/css?family=Ubuntu:regular,bold&subset=Latin">
		<script src="assets/js/jquery.min.js"></script>

		<!-- Favicon -->
		<link rel="shortcut icon" href="assets/ico/favicon.png">
	</head>

	<body>
		<div class="navbar navbar-inverse navbar-fixed-top">
			<div class="navbar-inner">
				<%
					AccountService as = (AccountService)session.getAttribute("as");
					if (as == null || as.getCurrentUser() == null) { %>
						<%@include file="logged_out.jsp" %>
					<% } else { %>
						<%@include file="logged_in.jsp" %>
					<% }
				%>
			</div>
		</div>

		<div class="container">