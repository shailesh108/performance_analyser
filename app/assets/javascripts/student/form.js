$(document).ready(function(){
	$('.datepicker').datetimepicker({format: 'DD-MM-YYYY'});
	$('.datetimepicker').datetimepicker({format: 'DD-MM-YYYY h:mm A'});
});
$(document).on("ready page:change", function() {
    $('.tag-tooltip').tooltip();
});
