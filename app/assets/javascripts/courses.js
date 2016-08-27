$(document).ready(function(){
  $("#course-info").on("hide.bs.collapse", function(){
    $(".btn").html('More Info');
  });
  $("#course-info").on("show.bs.collapse", function(){
    $(".btn").html('Less Info');
  });
});
