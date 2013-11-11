<div class="container">
        <button type="button" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
        </button>
        <a class="brand" href="http://www.imdb.com"><img src="assets/img/logo.png" alt="IMDb Logo" style="height: 25px;"/></a>
        <div class="nav-collapse collapse">
                <form class="navbar-form pull-right" action="index" method="post">
                        <input name="loginUsername" class="span2" type="text" placeholder="Username">
                        <input name="loginPassword" class="span2" type="password" placeholder="Password">
                        <input type="hidden" name="type" value="login">
                        <button type="submit" class="btn btn-success">Sign in</button>
                </form>
                <div class="navbar-form pull-right">
                        <button class="btn btn-primary" onclick="loginFacebook(this)">Facebook</button>
                        <strong style="padding-left:1em;padding-right:1em;color:white;">OR</strong>
                </div>
        </div>
</div>