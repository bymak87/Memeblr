(function() {

  $(document).dblclick(function(event){
    event.preventDefault();
    return false;
  });

  var currentImageId = 1;
  var imageTotal = $('div .meme img').length

  $("div.meme > a").not(":first-child").hide();

  $('#next').on('click', function() {
    if (currentImageId < imageTotal) {
      $currentImg = $("div.meme img[data-id="+ currentImageId +"]");
      $currentImg.hide();
      currentImageId += 1;
      $("div.meme img[data-id="+ currentImageId +"]").show();
    }
  })

  $('#prev').on('click', function() {
    if (currentImageId > 1) {
      $currentImg = $("div.meme img[data-id="+ currentImageId +"]");
      $currentImg.hide();
      currentImageId -= 1;
      $("div.meme img[data-id="+ currentImageId +"]").show();
    }

  })

  $('.admin-like').on('click', function() {
    $('#like').slideToggle(3000);
    $(this).text(function(i, text) {
      return text === 'like' ? 'dislike' : 'like';
    });
  });

})();



