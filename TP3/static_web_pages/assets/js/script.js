function submitCategories() {
	if ($(':checkbox:checked').length == 0) {
		alert("At least one category must be selected!");
		return;
	}

	if ($('#email').val().length == 0) {
		alert("Email must be filled!");
		return;
	}

	if ($(':radio:checked').length == 0) {
		alert("You must choose type of subscription!");
		return;
	}

	$('form').submit();
}

function checkAll() {
	$('[name="category"]').prop('checked',true);
}

function checkNone() {
	$('[name="category"]').prop('checked',false);
}