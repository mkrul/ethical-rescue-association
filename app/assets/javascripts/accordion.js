$(document).ready(function() {
  var allPanels = $('.accord-content').hide();
  var heads = $('.accordion header');
  $(heads).on('click', function() {
    $this = $(this);
    $target =  $this.parent().find('div.accord-content');
    if (!$target.hasClass('active')) {
      heads.removeClass('selected');
      $this.addClass('selected');
      allPanels.removeClass('active').slideUp();
      $target.addClass('active').slideDown();
    } else {
      heads.removeClass('selected');
      allPanels.removeClass('active').slideUp();
    }
  });
});