$(function(){



	var obj = APP("common", {

		update_schedule: function(e) {
			var $this = $(e.target);
			var schedule_for = $this.attr('data-value');
			$.get('/schedule/'+schedule_for, null, function(response) {
				$('#schedule').html(response);
			});
		}

	});



	$(function($){
		$('.get_schedule_btn').click(obj.update_schedule);
	});



});