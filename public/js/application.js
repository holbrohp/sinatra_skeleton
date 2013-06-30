$(document).ready(function() {
	$('.game_form').on('submit', function(e){
		$('.game_form').hide();
		e.preventDefault(); 
		var route = $(this).attr('action');
		// console.log($(this));
		var request = $(this).serialize();
		console.log(request);
		$.ajax({
			type: "POST",
			url: route,
			data: { user_guess: $(this).find('input').val() }
		}).done(function(data){
			var response = data.guess.correct.toString()
			$('#success').html("Your answer was " + response);
			$('#success').fadeIn();
			$('form:nth-child(1)').slideUp().remove();
			setTimeout(function(){$('#success').fadeOut()},1500);
		});
	});
});
