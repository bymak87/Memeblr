$(document).ready(function(){
  $('.admin-like').on('click', function() {
    $('#like').slideToggle(3000);
    $(this).text(function(i, text) {
      return text === 'like' ? 'dislike' : 'like';
    });

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

