// added this glitch to avoid link opening into new Safari window 
$(document).ready(function() {
	$("a").on('click', function() {
		window.location = $(this).attr("href");
		return false;
	});
});

