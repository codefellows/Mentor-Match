$(function(){
  $('.detail_1').addClass("isVisible");
});

$(function(){
  $('.next').click(function(){
    if($(".detail_1").hasClass("isVisible")){
      $(".detail_1").removeClass("isVisible");
      $(".detail_2").addClass("isVisible");
    } else if($(".detail_2").hasClass("isVisible")) {
      $(".detail_2").removeClass("isVisible");
      $(".detail_3").addClass("isVisible");
    } else if($(".detail_3").hasClass("isVisible")) {
      $(".detail_3").removeClass("isVisible");
      $(".detail_4").addClass("isVisible");
    } else if($(".detail_4").hasClass("isVisible")) {
      $(".detail_4").removeClass("isVisible");
      $(".detail_5").addClass("isVisible");
    }
  })
});

$(function(){
  $('.last').click(function(){
    if($(".detail_5").hasClass("isVisible")){
      $(".detail_5").removeClass("isVisible");
      $(".detail_4").addClass("isVisible");
    } else if($(".detail_4").hasClass("isVisible")) {
      $(".detail_4").removeClass("isVisible");
      $(".detail_3").addClass("isVisible");
    } else if($(".detail_3").hasClass("isVisible")) {
      $(".detail_3").removeClass("isVisible");
      $(".detail_2").addClass("isVisible");
    } else if($(".detail_2").hasClass("isVisible")) {
      $(".detail_2").removeClass("isVisible");
      $(".detail_1").addClass("isVisible");
    }
  })
});

$(function(){
  // when user taps "favorite" button, slide confirmation dialogue into view and shadow other elements
  $(".addToFavorites").click(function(){
    $(".popBox.favorite").css({"transform": "translateY(0)", "opacity": "1"});
    $(".popShadow").css({"opacity": ".4", "z-index": "3"});
  });
  // If user taps "no" button, remove confirmation dialogue from view and reveal other elements.
  $(".noAdd").click(function(){
    $(".popBox.favorite").css({"transform": "translateY(100vh)", "opacity": "0"});
    $(".popShadow").css({"opacity": "0", "z-index": "-1"});
  });
  // If user confirms "yes", remove confirmation dialogue from view and replace it with a notification that the user being viewed has been added to the current user's favorites list. Clicking on the Codefellows logo will navigate back to their homepage.
  $(".yesAdd").click(function(){
    $(".popBox.favorite").css({"transform": "translateZ(-500px)", "opacity": "0"});
    $(".popMessage.favorite").css({"transform": "translateY(0)", "opacity": "1"})
  });
  $(".goHome").click(function(){
    $(".popMessage.favorite").css({"transform": "translateZ(-500px)", "opacity": "0"});
    $(".popShadow").css({"opacity": "0", "z-index": "-1"});
  });
  // If user taps "contact" button, slide confirmation dialogue into view and dim other elements.
  $(".contactUser").click(function(){
    $(".popBox.contact").css({"transform": "translateY(0)", "opacity": "1"});
    $(".popShadow").css({"opacity": ".4", "z-index": "3"});
  });
  // If user taps "no" button, remove confirmation dialogue from view and reveal other elements.
  $(".noIntro").click(function(){
    $(".popBox.contact").css({"transform": "translateY(100vh)", "opacity": "0"});
    $(".popShadow").css({"opacity": "0", "z-index": "-1"});
  });
  // If user confirms "yes", remove confirmation dialogue from view and replace it with a notification that the user being viewed has been sent a message. Clicking on the Codefellows logo will navigate back to the current user's homepage.
  $(".yesIntro").click(function(){
    $(".popBox.contact").css({"transform": "translateZ(-500px)", "opacity": "0"});
    $(".popMessage.contact").css({"transform": "translateY(0)", "opacity": "1"})
  });
  $(".goHome").click(function(){
    $(".popMessage.contact").css({"transform": "translateZ(-500px)", "opacity": "0"});
    $(".popShadow").css({"opacity": "0", "z-index": "-1"});
  });

});