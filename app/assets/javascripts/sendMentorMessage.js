var sendMentorMessage = function (){
  $(".popBox").css("margin-top", "-100vh");
  $(".messageSent").css("margin-bottom", "0");
}

$(function(){
  $("#yes").click(sendMentorMessage);
});