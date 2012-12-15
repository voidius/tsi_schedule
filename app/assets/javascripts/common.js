$(function(){



	var obj = APP("common", {

		update_shedule: function(e) {
			var $this = $(e.target);
			var shedule_for = $this.attr('data-value');
			$.get('/shedule/'+shedule_for, null, function(response) {
				$('#shedule').html(response);
			});
		}

	});



	$(function($){
		$('.get_shedule_btn').click(obj.update_shedule);
	});



});