function View() {

	this.update= function() {
		$('form').hide();
		$('.nudge_container').append("<br><br><p>Your nudge will be sent at <%= @nudge.datetime %> to <%= @nudge.receiver_name %></p>");
	};
};

