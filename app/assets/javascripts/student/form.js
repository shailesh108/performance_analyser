$(document).ready(function(){
	$('.datepicker').datetimepicker({format: 'DD-MM-YYYY'});
	$('.datetimepicker').datetimepicker({format: 'DD-MM-YYYY h:mm A'});
});
$(document).on("ready page:change", function() {
    $('.tag-tooltip').tooltip();
});
$(function () {

    $('.toggle').click(function (event) {
        event.preventDefault();
        var target = $(this).attr('href');
        $(target).toggleClass('hidden show');
    });

});

$(document).ready(function() {
    $('input').change(function(){
        var yes = $('.yes:checked').length
        
        $('.yes_results').text(yes)
                             
    })
});