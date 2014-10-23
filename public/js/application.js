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
		data: data, 
		success: function(returned_nudge) {
			$('form').hide();
			var sentence = "Your nudge will be sent at " + returned_nudge["datetime"] + " to " + returned_nudge["receiver_name"]
			$('.nudge_container').append("<br><br><p>" + sentence + "</p>");
		}
	});
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

