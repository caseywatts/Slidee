//# Place all the behaviors and hooks related to the matching controller here.
//# All this logic will automatically be available in application.js.
//# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/


// Make the first slide visible (they're all off the the right side at left:150%)
$(document).ready(function() {
  $('#container').children().first().addClass("boxcenter");
  $('#container').children().first().css('left','0%');
  $('#container').children().first().removeClass("boxleft");
  $('#container').children().first().removeClass("boxright");
});


//// Slide Movement ////
// This is all based off of jquery animation: http://api.jquery.com/animate/
// This code was based off the simple example here: http://stackoverflow.com/questions/4741880/slide-a-div-offscreen-using-jquery to make our divs move.

// Next Slide //
function nextslide() {
    //make current slide go away (to left)
    makeleft($('#container').children(".boxcenter"));
    //make the next slide appear (from right)
    makecenter($('#container').children(".boxright").first());

}

// Previous Slide //
function previousslide(){
    //make current one go away (to right)
    makeright($('#container').children(".boxcenter"));
    //make the last one appear (from left)
    makecenter($('#container').children(".boxleft").last());
}

function makecenter(x){
  x.addClass("boxcenter");
  x.removeClass("boxleft");
  x.removeClass("boxright");
  x.animate({
    left: '0%'}, 500);
}
function makeright(x){
  x.addClass("boxright");
  x.removeClass("boxleft");
  x.removeClass("boxcenter");
  x.animate({
    left: '150%'}, 500);
}
function makeleft(x){
  x.addClass("boxleft");
  x.removeClass("boxcenter");
  x.removeClass("boxright");
  x.animate({
    left: '-150%'}, 500);
}

//// MOUSE ENACTED SHORTCUTS ////

////CLICKING on the slide progresses it forward (we may want to remove this specific functionality~)
  //$('.box').click(function() {
      //$(this).animate({
         //left: '-50%'

      //}, 500, function() {
         //$(this).css('left', '150%');
         ////we'll want to change class to "current slide" and remove it from the others
         //$(this).appendTo('#container');
      //});

     //$(this).next().animate({
         //left: '0%'
     //}, 500);
  //});





//// KEYBOARD SHORTCUTS ////
//Original example taken from http://www.catswhocode.com/blog/using-keyboard-shortcuts-in-javascript (thanks!)


// PGUP AND PGDN //
//move the presentation forward & backward
//TODO: one thing that can break: pressing the buttons fast. The appendTo shouldn't be after 500ms.
$(document).keyup(function (e) {
  if(e.keyCode == 34) nextslide(); //pagedown
  if(e.keyCode == 33) previousslide(); //pageup
});


// Alt + n  => notes tab //
// Replace "17" with the alt number
// Replace "83" with n or q
var isAlt = false;$(document).keyup(function (e) {
if(e.which == 17) isAlt=false;
}).keydown(function (e) {
    if(e.which == 17) isAlt=true;
    if(e.which == 83 && isAlt == true) {
      alert('Keyboard shortcuts + JQuery are even more cool!');
      return false;
    }
    if(e.which == 85 && isAlt == true) {
      alert('Keyboard shortcuts + JQuery are even more cool!');
      return false;
    }
});

//// Alt + q  => questions tab //
//var isAlt = false;$(document).keyup(function (e) {
//if(e.which == 17) isAlt=false;
//}).keydown(function (e) {
    //if(e.which == 17) isAlt=true;
    //if(e.which == 83 && isAlt == true) {
        //alert('Keyboard shortcuts + JQuery are even more cool!');
   //return false;
 //}
//});


//an example of a two-key-press shortcut, for reference
//Example taken from http://www.catswhocode.com/blog/using-keyboard-shortcuts-in-javascript (thanks!)
//var isCtrl = false;$(document).keyup(function (e) {
//if(e.which == 17) isCtrl=false;
//}).keydown(function (e) {
    //if(e.which == 17) isCtrl=true;
    //if(e.which == 83 && isCtrl == true) {
        //alert('Keyboard shortcuts + JQuery are even more cool!');
   //return false;
 //}
//});



