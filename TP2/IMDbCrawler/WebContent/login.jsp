<%@include file="header.jsp" %>	
<div class="row">
	
	<!-- Main hero unit for a primary marketing message or call to action -->
	<div class="span4">
		<div class="hero-unit">
			<h2>Receive Updates!</h2>
		</div>
		<div class="hero-unit">
			<h2>Browse Movies!</h2>
		</div>
	</div>

	<div class="span1">
	</div>
	<div class="span6">
		<div class="hero-unit">
			<h2 style="text-align: center;">Register Now!</h2>
			<form class="form-signin" style="padding-top:2em; text-align: center" action="index" method="post">
				<div style="width:75%; padding-left:12.5%;padding-bottom:1em;">
					<input name="name" id="registerName" required type="text" class="input-block-level" placeholder="Name">
					<input name="email" id="registerMail" required type="text" class="input-block-level" placeholder="Email Address">
					<input name="username" id="registerUsername" required type="text" class="input-block-level" placeholder="Username">
					<input name="password" id="registerPassword" required type="password" class="input-block-level" placeholder="Password">
					<input type="hidden" name="type" value="register">
				</div>
				<button class="btn btn-success" type="submit">Sign Me Up!</button>
			</form>
		</div>
	</div>
	<div class="span1">
	</div>
</div>
<%@include file="footer.jsp" %>	