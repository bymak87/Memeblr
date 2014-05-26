$(document).ready(function(){
  $('.admin-like').on('click', function() {
    $(this).text('dislike');
    $('#like').show();
  })

  $('.g-mode').on('click', function() {
    $('#like').hide();
    $('#g-like').show();
  })

  $('#next').on('click', function() {
    alert('next image');
  })

  $('#next').on('mouseenter', function() {

  })

  $('#prev').on('click', function() {
    alert('prev image');
  })

  $('#prev').mouseover(function(){
    $(this).addClass('.hover');
  })



});

// finish toggle from dislike to like
// fix g-mode to only work if liked
// finish toggle from g-mode to regular
// add gunshot audio on click

