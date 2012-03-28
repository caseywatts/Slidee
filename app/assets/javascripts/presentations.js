//# Place all the behaviors and hooks related to the matching controller here.
//# All this logic will automatically be available in application.js.
//# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

//#For loading bar
function showMe(id) {
  var elem = document.getElementById(id);
  elem.style.visibility = "visible";
  elem.style.display = "block";
}


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
  if ($('#container').children(".boxright").length){
    //make current slide go away (to left)
    makeleft($('#container').children(".boxcenter"));
    //make the next slide appear (from right)
    makecenter($('#container').children(".boxright").first());
  }
}

// Previous Slide //
function previousslide(){
  if ($('#container').children(".boxleft").length){
    //make current one go away (to right)
    makeright($('#container').children(".boxcenter"));
    //make the last one appear (from left)
    makecenter($('#container').children(".boxleft").last());
  }
}

function makecenter(x){
  x.addClass("boxcenter");
  x.removeClass("boxleft");
  x.removeClass("boxright");
  x.animate({
    left: '0%'}, 200);
}
function makeright(x){
  x.addClass("boxright");
  x.removeClass("boxleft");//unnecessary
  x.removeClass("boxcenter");
  x.animate({
    left: '150%'}, 200);
}
function makeleft(x){
  x.addClass("boxleft");
  x.removeClass("boxcenter");
  x.removeClass("boxright");//unnecessary
  x.animate({
    left: '-150%'}, 200);
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



// Removing Browser Function of keystrokes //
// I don't know why we need both of these methods, but when I take one out, the browser gets the keystroke :/
window.onkeydown=function(e){
  if(e.keyCode==33){return false;}
};
window.onkeydown=function(e){
  if(e.keyCode==34){return false;}
};
window.addEventListener('keypress',function(e){if(e.keyCode==33){e.preventDefault();}},true);
window.addEventListener('keypress',function(e){if(e.keyCode==34){e.preventDefault();}},true);


// Moving forward & backward //
$(document).keyup(function (e) {
  if(e.keyCode == 34) nextslide(); //pagedown
  if(e.keyCode == 33) previousslide(); //pageup
  if(e.keyCode == 37) previousslide(); //leftarrowkey
  if(e.keyCode == 39) nextslide(); //rightarrowkey
  return false;
});


// Alt + n  => notes tab //
// Alt + q  => questions tab //

var isAlt = false;$(document).keyup(function (e) {
if(e.which == 18) isAlt=false;
}).keydown(function (e) {
    if(e.which == 18) isAlt=true;
    if(e.which == 78 && isAlt == true) { // 78 is n
      alert('alt+n');
      return false;
    }
    if(e.which == 81 && isAlt == true) { // 81 is q
      alert('alt+q');
      return false;
    }
});

//var isCtrl = false;$(document).keyup(function (e) {
//if(e.which == 17) isCtrl=false;
//}).keydown(function (e) {
    //if(e.which == 17) isCtrl=true;
    //if(e.which == 37 && isCtrl == true) { // 37 is leftarrow
      //previousslide();
      //return false;
    //}
    //if(e.which == 39 && isCtrl == true) { // 39 is rightarrow
      //nextslide();
      //return false;
    //}
//});
////Experimental code to watch pads for keystrokes
// from http://www.dyn-web.com/tutorials/iframes/refs.php
// and also from http://www.sitepoint.com/forums/showthread.php?520317-iframe-event-capturing
//document.getElementById('etherpadnote167').contentDocument.addEventListener("keyup", nextslide, false);

//$(".etherpadnote")
//document.getElementById('etherpadnote167').contentWindow

//var iFrm = document.getElementByClass();

//iFrm.contentWindow.document.body.innerHTML = "myText";
//if(iFrm.contentDocument) {
        //iFrm.contentDocument.addEventListener("keyup", nextslide, false);
        //iFrm.contentDocument.designMode = "on";
        //iFrm.contentWindow.focus();
//} else {
        //iFrm.contentWindow.document.body.attachEvent("onkeyup", callBack);
        //iFrm.contentWindow.document.body.contentEditable = true;
        //iFrm.contentWindow.document.body.focus();
//}



//// Alt + q  => questions tab //
//var isAlt = false;$(document).keyup(function (e) {
//if(e.which == 18) isAlt=false;
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



