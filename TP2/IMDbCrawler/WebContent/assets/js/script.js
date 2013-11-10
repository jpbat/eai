function loginFacebook(button) {

	button.disabled = false;
	console.log('starting to fetch from facebook.');

	FB.init({
		appId: '369284446540393', // App ID
		status: true, // check login statsufa
		cookie: true, // enable cookies to allow the server to access the session
		xfbml: true  // parse XFBML
	});

	FB.login(function (response) {
		if (response.status === "connected") {
			FB.api('/me?fields=picture.type(large),name,email', function(response) {
				console.log('ID: ' + response.id);
				console.log('Name: ' + response.name);
				console.log('Email: ' + response.email);
				console.log('Picture: ' + response.picture.data.url);
			});	
		}
	}, {scope: 'email'});
}

function scoreFilter() {
	$('#scoreFilter').modal();
}

function categoryFilter() {
	$('#categoryFilter').modal();
}

function submitScoreFilter() {
	var selected = $('#scoreFilterForm :radio:checked');
	
	if (selected.length == 0) {
		alert("One option must be checked!");
		return;
	}

	var value1 = $('#scoreFilterForm :radio:checked').parent().parent().find('.value').val()
	if (value1.length == 0) {
		alert("You should fill the values!");
		return;
	}
	
	if ($('#scoreFilterForm :radio:checked').val() === "between") {
		var value2 = $('#scoreFilterForm :radio:checked').parent().parent().find('.value')[1].value
		if (value2.length == 0) {
			alert("You should fill the values!");
			return;
		}

		if (value1 > value2) {
			alert("The second value should be bigger!");
			return;
		}
	}

	$('#scoreFilter').modal('hide');
	$('#scoreFilterForm').submit();
}

function submitCategoriesFilter() {
	var selected = $('#scoreCategoriesForm :checkbox:checked');
	
	if (selected.length == 0) {
		alert("At least one category must be selected!");
		return;
	}

	$('#categoryFilter').modal('hide');
	$('#scoreCategoriesForm').submit();
}

function editFavorites() {
	$('#selectFavorites').modal();
}

function submitCategoriesFilter() {
	var selected = $('#selectFavorites :checkbox:checked');
	
	if (selected.length == 0) {
		alert("At least one category must be selected!");
		return;
	}

	$('#selectFavorites').modal('hide');
	$('#selectFavoritesForm').submit();
}