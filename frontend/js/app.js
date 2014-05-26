$(document).ready(function(){
  $('.admin-like').on('click', function() {
    $('#like').slideToggle(3000);
    $(this).text(function(i, text) {
      return text === 'like' ? 'dislike' : 'like';
    });

  })

  $('.g-mode').on('click', function() {
    // $(this).toggleClass('#g-like');
  })

  $('#next').on('click', function() {
    alert('next image');
  })

  $('#prev').on('click', function() {
    alert('prev image');
  })

  $('.delete').on('click', function(){
    alert('delete image');
  })

});

// fix g-mode to only work if liked
// finish toggle from g-mode to regular
// add gunshot audio on click

