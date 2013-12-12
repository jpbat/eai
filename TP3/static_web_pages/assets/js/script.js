function submit() {
	if ($('#email_subscribe').val().length == 0 && $('#email_unsubscribe').val().length == 0) {
		alert("At least one email must be filled!");
		return;
	}

	if ($('#email_subscribe').val().length > 0 && $(':radio:checked').length == 0) {
		alert("You must choose type of subscription!");
		return;
	}

	$('form').submit();
}