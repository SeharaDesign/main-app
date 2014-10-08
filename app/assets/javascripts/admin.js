$(function(){
  $('#menu-options').hide();

  $('#admin-nav').on('mouseenter', function() {
    $('#menu-options').fadeIn();
  });

  $('#admin-nav').on('mouseleave', function() {
    $('#menu-options').fadeOut();
  });
});