

function showHide("search_results_all") {
  var element = document.getElementById("search_results_all");
  if (element.style.visibility == 'hidden') {
      element.style.visibility = 'visible';
  } else if (element.style.visibility == 'visible') {
      element.style.visibility = 'hidden';
  };
};