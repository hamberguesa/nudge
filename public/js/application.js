// $(document).ready(function() {
  
// });

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