$(document).ready(function(){
	$('[data-toggle=tab]').click(function(e){
	  if ($(this).parent().hasClass('active')){
		$($(this).attr("href")).toggleClass('active');
	  }
});