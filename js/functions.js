// If JavaScript is enabled remove 'no-js' class and give 'js' class
jQuery('html').removeClass('no-js').addClass('js');

// Add .osx class to html if on Os/x
if ( navigator.appVersion.indexOf("Mac")!=-1 ) 
	jQuery('html').addClass('osx');

// When DOM is fully loaded
jQuery(document).ready(function($) {
  "use strict";

$('.animated').appear(function() {
  $(this).each(function(){   
    $(this).css('visibility','visible');
    $(this).addClass($(this).data('type'));
  });
},{accY: -150});

$('.skill-shortcode').appear(function() {
  $('.progress').each(function(){ 
    $('.progress .bar').css('width',  function(){ return ($(this).attr('data-percentage')+'%')});
  });
},{accY: 0});
  $('.zoom-img').zoom();
  $('.popup-link').magnificPopup({
  		type: 'image'
  	});
 
/* Nice Scroll */
  	$("html").niceScroll({zindex:99999,cursorborder:"1px solid #464646"});

// External links   
	(function() {
	    $(window).load(function() {
			$('a[rel=external]').attr('target','_blank');	
		});                                            
	})(); 
    
// Tooltips		
	(function() {
    $('body').tooltip({
        delay: { show: 300, hide: 0 },
        selector: '[data-toggle=tooltip]:not([disabled])'
    });
  })(); 
  
// Accordion 
$(function() {
    $('.accordion').on('show', function (e) {
         $(e.target).prev('.accordion-heading').find('.accordion-toggle').addClass('ac-active');
    });
    
    $('.accordion').on('hide', function (e) {
        $(this).find('.accordion-toggle').not($(e.target)).removeClass('ac-active');
    }); 
});

   var detectmob = false;	
   if(navigator.userAgent.match(/Android/i)
    || navigator.userAgent.match(/webOS/i)
    || navigator.userAgent.match(/iPhone/i)
    || navigator.userAgent.match(/iPad/i)
    || navigator.userAgent.match(/iPod/i)
    || navigator.userAgent.match(/BlackBerry/i)
    || navigator.userAgent.match(/Windows Phone/i)) {							
      detectmob = true;
	}

	if (detectmob === true) {
    $( '.parallax' ).each(function(){
				$(this).addClass('parallax-mobile');
		});
  }
  else {
  //.parallax(xPosition, speedFactor, outerHeight) options:
	//xPosition - Horizontal position of the element
	//inertia - speed to move relative to vertical scroll. Example: 0.1 is one tenth the speed of scrolling, 2 is twice the speed of scrolling
	//outerHeight (true/false) - Whether or not jQuery should use it's outerHeight option to determine when a section is in the viewport
      $( '#parallax-one' ).parallax("100%", 0.5,true);
      $( '#parallax-two' ).parallax("300%", 0.1),true; // Add more
      $( '#parallax-three' ).parallax("50%", 0.5,true); // Add more
      $( '#parallax-four' ).parallax("50%", 0.1,true); // Add more
      $( '#parallax-five' ).parallax("50%", 0.5),true; // Add more 
    }
 
// back to top 

		$('.back-to-top').click(function () {
			$('body,html').animate({
				scrollTop: 0
			}, 800);
			return false;
		});
});