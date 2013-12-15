function addSubscription() {
	if ($('#email_subscribe').val().length == 0) {
		alert("Email must be filled!");
		return false;
	}

	if ($(':radio:checked').length == 0) {
		alert("You must choose type of subscription!");
		return false;
	}

	return true;
}

function removeSubscription() {
	if ($('#email_unsubscribe').val().length == 0) {
		alert("Email must be filled!");
		return false;
	}

	return true;
}