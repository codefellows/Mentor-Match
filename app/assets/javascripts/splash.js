window.onscroll = function(){
  document.getElementById('student').style.opacity='1';
  document.getElementById('mentor').style.opacity='1';
}

$(document).ready(function(){
  $('.splash').mouseenter=function(){
    document.getElementById('student').style.opacity='1';
    document.getElementById('mentor').style.opacity='1';
  }

// var studentRoleButton=document.getElementById('findMentor');
// var mentorRoleButton=document.getElementById('beMentor');

var assignRoleStudent=function(){
  document.cookie="role=student";
}
var assignRoleMentor=function(){
  document.cookie="role=mentor; path=path; domain=domain;";
}

document.getElementById('findMentor').onclick=assignRoleStudent();
document.getElementById('beMentor').onclick=assignRoleMentor();
});
// studentRoleButton.addEventListener("click", assignRoleStudent());

// mentorRoleButton.addeventListener("click", assignRoleMentor());
