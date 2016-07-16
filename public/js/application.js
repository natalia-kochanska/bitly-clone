$(document).ready(function() {
   	$('form').on('submit', function(event){
   		event.preventDefault();
   		$(this).find("input[type='submit']")
   		.attr('disabled', true);
   		.addClass('disabled');

   		$ajax({
   			url: '/urls',
   			method: 'POST',
   			data: $(this).serialize(),
   			dataType: 'jason'
   			success: function(data) {				
   				$('form').find('input[type="submit"]').attr('disabled', false).removeClass('disabled').val();
   			};
   			error: function(data) {
   				$('.info').append('<p>The URL is not valid. Please try again.</p>');
   			}
   		});

   	});
});