(function() {
  // initiate the first image as you
  var currentImageId = 1;

  $("div.meme > a").not(":first-child").hide();

  $('#next').on('click', function() {
    var maxLength = +$("div.meme img").length;
    $currentImg = $("div.meme img[data-id="+ currentImageId +"]");
    $currentImg.hide();
    if (!maxLength) {
      currentImageId += 1;
    }
    $("div.meme img[data-id="+ currentImageId +"]").show();
  })

  $('#prev').on('click', function() {
    $currentImg = $("div.meme img[data-id="+ currentImageId +"]");
    $currentImg.hide();
    // make sure it can't go lower than the first img
    if (currentImageId !== 1 ) {
      currentImageId -= 1;
    }
    $("div.meme img[data-id="+ currentImageId +"]").show();
  })

  $('.admin-like').on('click', function() {
    $('#like').slideToggle(3000);
    $(this).text(function(i, text) {
      return text === 'like' ? 'dislike' : 'like';
    });
  });
})();




  // $('.g-mode').on('click', function() {
  //   // $(this).toggleClass('#g-like');
  // })

  // $('#next').on('click', function() {
    // alert('next image');
  // })

  // $('#prev').on('click', function() {
    // alert('prev image');
  // })

  // $('.delete').on('click', function(){
    // alert('delete image');
  // })


// fix g-mode to only work if liked
// finish toggle from g-mode to regular
// add gunshot audio on click

