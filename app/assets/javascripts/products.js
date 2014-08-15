// Product Tab Interface ***** CURRENTLY NOT IN USE ******

// $(function() {
//     $('.tab:first').fadeIn(); //fade in first tab on load
//     $(".tab").not(":first").hide();   //hiding tab content except first one 
//     $("ul.tabs li").click(function() { //on tab click ($this)
//         $("ul.tabs li.active").removeClass("active"); // remove class .active
//         $(this).addClass("active"); // set $this to class .active
//         $(".tab").hide(); // hide content from all tabs      
//         $($('a',this).attr("href")).fadeIn('slow');  // match the content id (e.g., #tab1 with the value of $this's href attribute)
//         return false; //event.preventDefault(); event.stopPropagation();
//     });               //stops callback execution and returns immediately when called.
// });



// Masonry.js Library for Image Gridding 

$(function() {
  var masonGrid = $('.js-masonry');
  // initialize Masonry after all images have loaded
  $.makeArray(masonGrid).forEach(function(element, index) {
    imagesLoaded(element, function() {
      msnry = Masonry.data(element);
      console.log(msnry);
      msnry.layout();
    });
  });
});

// BXSlider for opening header

$(document).ready(function(){
  $('.bxslider').bxSlider({
    pager: false,
    speed: 800,
    auto: true
  });
});

// Adds class to resize images for Masonry.js

$(function() {
  var images = $('.item');
  $.makeArray(images).forEach(function(element, index) {
    if (index % 6 === 0) {
      $(element).addClass('large');
    } else if (index % 2 === 0) {
      $(element).addClass('small');
    } else {
      return false;
    }
  });
});




















