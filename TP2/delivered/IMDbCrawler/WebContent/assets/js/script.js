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

function submitFavoritesFilter() {
	var selected = $('#selectFavorites :checkbox:checked');
	
	if (selected.length == 0) {
		alert("At least one category must be selected!");
		return;
	}

	$('#selectFavorites').modal('hide');
	$('#selectFavoritesForm').submit();
}

function checkAll() {
	$('[name="category"]').prop('checked',true);
}

function checkNone() {
	$('[name="category"]').prop('checked',false);
}