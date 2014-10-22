$(document).ready(function() {
	view = new View();
	$('.create_nudge').on("click", confirm_nudge)
})

var confirm_nudge = function(evt) {
	// evt.preventDefault();
	$.ajax({
		url: 'nudges/create',
		type: 'POST'
	}).done(view.update())
}



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

