//# Place all the behaviors and hooks related to the matching controller here.
//# All this logic will automatically be available in application.js.
//# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$(document).ready(function(){
  $('#container').children().first().css('left', '0%')

  // we use code adapted from http://stackoverflow.com/questions/4741880/slide-a-div-offscreen-using-jquery to make our divs move.
  //Clicking on the slide progresses it forward (we may want to remove this specific functionality~)
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



//PgUp and PgDn move the presentation forward & backward
$(document).keyup(function (e) {

  if(e.keyCode == 34) { //pagedown
    $('#container').children().first().animate({ //we should store this member in a variable, since we're manipulating it twice
      left: '-50%'
      }, 500, function() {
      $(this).css('left', '-150%');
      $(this).appendTo('#container');
      });
    $('#container').children().first().next().animate({
     left: '0%'
     }, 500);
  }

 if(e.keyCode == 33) { //pageup
    $('#container').children().last().animate({
      left: '50%'
      }, 500, function() {
      $(this).css('left', '150%');
      $(this).prependTo('#container');
      });
    $('#container').children().last().next().animate({ //change "last" to "~previous"
     left: '0%'
     }, 500);
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

