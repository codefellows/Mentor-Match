var profileScroller = function () {
  (function() {
    $('#next_1').click(function () {
      if($('#s2').length > 0) {
        $.scrollTo('#s2', 800, { easing: 'swing' });
      } else {
        $.scrollTo('#s6', 800, { easing: 'swing' });
      }
    });

    $('#next_2').click(function () {
      $.scrollTo('#s3', 800, { easing: 'swing' });
    });

    $('#next_3').click(function () {
      $.scrollTo('#s4', 800, { easing: 'swing' });
    });

    $('#next_4').click(function () {
      $.scrollTo('#s5', 800, { easing: 'swing' });
    });

    $('#next_5').click(function () {
      $.scrollTo('#s6', 800, { easing: 'swing' });
    });
  })();
}

$(document).ready(profileScroller);
$(document).on('page:load', profileScroller);
