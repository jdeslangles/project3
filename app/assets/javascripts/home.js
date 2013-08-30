// function showHide(search_results_all) {
//   var element = document.getElementById("search_results_all");
//     // e.preventDefault();
//     element.style.display = "block";
//     return false;
// };


  // $('#submit_form_button').on("submit", function (e) {
  //   e.preventDefault();
  //   $('#search_results_all').show();
  // });
$(function(){
  $('#submit_form_button').on("submit", function (event) {
    event.preventDefault();
    $('#search_results_all').fadeIn(200);
  });


  $('.carousel').carousel({
    interval: 4000
  });
});