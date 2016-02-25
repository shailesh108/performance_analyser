$(document).ready(function(){
	$('.datepicker').datepicker({format: 'dd-mm-yyyy'});
});
$(document).on("ready page:change", function() {
    $('.tag-tooltip').tooltip();
});