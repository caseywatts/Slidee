//# Place all the behaviors and hooks related to the matching controller here.
//# All this logic will automatically be available in application.js.
//# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$(document).ready(function(){

  // we use code adapted from http://stackoverflow.com/questions/4741880/slide-a-div-offscreen-using-jquery to make our divs move.
  $('.box').click(function() {
      $(this).animate({
         left: '-50%'
      }, 500, function() {
         $(this).css('left', '150%');
         //we'll want to change class to "current slide" and remove it from the others
         $(this).appendTo('#container');
      });

     $(this).next().animate({
         left: '0%'
     }, 500);
  });

$(document).keyup(function (e) {
  if(e.which == 33) { //pageup
    
  }
  if(e.which == 34) { //pagedown
    $('#container'). //child? .first
  }


});

var isCtrl = false;$(document).keyup(function (e) {
if(e.which == 17) isCtrl=false;
}).keydown(function (e) {
    if(e.which == 17) isCtrl=true;
    if(e.which == 83 && isCtrl == true) {
        alert('Keyboard shortcuts + JQuery are even more cool!');
 	return false;
 }
});

});

