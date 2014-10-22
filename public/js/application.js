$(document).ready(function() {
	view = new View();
	$('.create_nudge').on("click", confirm_nudge)
})

var confirm_nudge = function(evt) {
	evt.preventDefault();
	var data = $('.form-signup').serialize();

	$.ajax({
		url: 'nudges/create',
		type: 'POST',
		data: data
	}).done(view.update(returned_nudge))
};



// the below should probably go in the view

$(document).ready(function() {
	$("#datepicker").datepicker({ dateFormat: 'yy-mm-dd' });
});

$(document).ready(function() {
	$( "#hour" ).selectmenu();
	$( "#minute" )
	.selectmenu()
	.selectmenu( "menuWidget" )
	.addClass( "overflow" );
});

