(function($) {
  $(document).ready(function() {
    var h = $(window).height();
    var header_footer = 106;
    var wrap_min_height = h - header_footer + "px";
    $(".wrap").css("min-height", wrap_min_height);
  });
})(jQuery);
