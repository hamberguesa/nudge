function View() {

	this.update= function(returned_nudge) {
		$('form').hide();
		var sentence = "Your nudge will be sent at" + returned_nudge["datetime"] + " to " + returned_nudge["receiver_name"]
		$('.nudge_container').append("<br><br><p>" + sentence + "</p>");
	};
};

