//# Place all the behaviors and hooks related to the matching controller here.
//# All this logic will automatically be available in application.js.
//# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$(document).ready(function(){

  // makes the first slide visible
  $('#container').children().first().css('left', '0%')

//// Slide Movement ////
// This is all based off of jquery animation: http://api.jquery.com/animate/
// This code was based off the simple example here: http://stackoverflow.com/questions/4741880/slide-a-div-offscreen-using-jquery to make our divs move.



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
//TODO: one thing that can break: pressing the buttons fast. The appendTo shouldn't be after 500ms.
$(document).keyup(function (e) {

  if(e.keyCode == 34) { //pagedown
    nextslide();
  }

 if(e.keyCode == 33) { //pageup
    previousslide();
  }

});


//Next Slide
function nextslide() {
    //make current slide go away (to left)
    $('#container').children().first().animate({ //current slide
      left: '-50%'},
      500,
      function() {
        $(this).css('left', '-150%');
        $(this).appendTo('#container');
      }
    );
    //make the next slide appear (from right)
    $('#container').children().first().next().animate({ //wanted slide
      left: '0%'},
      500);
}


//Previous Slide
function previousslide(){
    //make current one go away (to right)
    $('#container').children().first().animate({ //current slide
      left: '+50%'},
      500,
      function() {
        $(this).css('left', '150%');
      }
    );
    //make the last one appear (from left)
    $('#container').children().last().animate({ //wanted slide
      left: '0%'},
      500,
      function() {
        $(this).prependTo('#container');
      }
    );
}

//an example of a two-key-press shortcut, for reference
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

