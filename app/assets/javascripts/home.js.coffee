$ ->

  render_results = (data)->
    $('#search_results_all').empty();
    $('#search_results_all').fadeIn(200);
    console.log(data)
    for user in data.users
      console.log(user)
      $('#search_results_all').append("<p id='search_results_users'>" + user.username+ "</p>");
    for trip in data.trips
      console.log(trip)
      $('#search_results_all').append("<p id='search_results_trips'>" + trip.name+ "</p>");
    for marker in data.markers
      console.log(marker)
      $('#search_results_all').append("<p id='search_results_markers'>" + marker.address+ "</p>");


  $('#submit_form_button').on "submit", (event) ->
    event.preventDefault()
    query = $("#q").val()
    $.ajax
      type: "POST"
      url: "/"
      data:
        q: query
      success: render_results



  # $('.carousel').carousel({
  #   interval: 4000
  # });