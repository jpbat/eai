<%@page import="services.AccountService"%>

<div class="container">
	<button type="button" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
		<span class="icon-bar"></span>
		<span class="icon-bar"></span>
		<span class="icon-bar"></span>
	</button>
	<a class="brand" href="http://www.imdb.com"><img src="assets/img/logo.png" alt="IMDb Logo" style="height: 25px;"/></a>
	<div class="nav-collapse collapse">
		<div class="navbar-form pull-right">
			<!-- CHANGED -->
			<img id="picture" data-toggle="popover" src="<%= as.getCurrentUser().getPicture() %>" style="border-radius: 8px; padding-top: 8px;">
			<a  href="./me"  style="padding-left: 8px;"><strong><%= as.getCurrentUser().getName()%></strong></a>
		</div>
	</div>
</div>


<div id="content" style="display: none">
   <a href="./logout" class="btn btn-danger btn-mini">Logout</a>
</div>

<script type="text/javascript">
$(function () {
    $("#picture").popover({
        placement : 'bottom',
        trigger: 'hover',
        delay: { show: 0, hide: 500 },
        html: true,
        content: $('#content').html()
    });
});
</script>