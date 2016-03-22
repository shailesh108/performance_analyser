$(document).ready(function(){

clock = setInterval(function(){
          updateClock();
  },1000);

	$('.datepicker').datetimepicker({format: 'DD-MM-YYYY'});
	$('.datetimepicker').datetimepicker({format: 'DD-MM-YYYY h:mm A'});


      $('input').change(function(){
        var yes = $('.yes:checked').length
        var no_ques=$('.ques').text()
        $('.yes_results').text(yes)
        var elem = document.getElementById('chart');
        elem.style.width = ((yes*100)/no_ques) + "%";                   
       
    })
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


$(function() {
  $('a#trigger').hover(function() {
    $('div#pop-up').show();
  }, function() {
    $('div#pop-up').hide();
  });
});
