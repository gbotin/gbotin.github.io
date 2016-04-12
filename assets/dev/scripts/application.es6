const $ = global.$ = global.jQuery = require('jquery');
require('bootstrap');

$(function() {

  var $popovers;
  $('[data-toggle="tooltip"]').tooltip();

  $popovers = $('[data-toggle="popover"]')
    .popover()
    .on('click', function(e) {
      e.preventDefault();
      return $popovers.not(this).popover('hide');
    });

  $(document).on('click', function(e) {
    return $popovers.each(function() {
      if (!$(this).is(e.target) && $(this).has(e.target).length === 0 && $('.popover').has(e.target).length === 0) {
        return $(this).popover('hide');
      }
    });
  });

  $('.ability-item .logo').on('click', function(e) {
    return e.preventDefault();
  });

  return $('#portfolio-gallery').on('show.bs.modal', function(event) {
    var $button;
    $button = $(event.relatedTarget);
    $(this).find('.expanded').attr('src', $button.data('image'));
    return $(this).find('.expanded').attr('title', $button.data('title'));
  });

});
