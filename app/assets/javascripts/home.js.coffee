$ ->

# SEARCH FUNCTIONALITY
  render_results = (data)->
    $('#users').empty();
    $('#trips').empty();
    $('#stops').empty();
    # $('#search_results_all').fadeIn(200);
    for user in data.users
      console.log(user)
      $('#users').append("<p id='search_results_users'>" + user.username+ "</p>");
    for trip in data.trips
      console.log(trip)
      $('#trips').append("<p id='search_results_trips'>" + trip.name+ "</p>");
    for marker in data.markers
      console.log(marker)
      $('#stops').append("<p id='search_results_markers'>" + marker.address+ "</p>");

  flash_error = (errors) ->
    $('#search_results_all').append("<p id='search_error'>"+errors+"</p>")
    $("#search_results_all").fadeIn(200).delay(3000).fadeOut(200)

# showDiv = ->
#   $("#search_results_all'").style.display = "block"
#   $('#search_results_all').empty();

  $('#submit_form_button').on "submit", (event) ->
    event.preventDefault()
    query = $("#q").val()
    $.ajax
      type: "POST"
      url: "/"
      data:
        q: query
      success: render_results
      error: (xhr) ->
        errors = $.parseJSON(xhr.responseText).errors
        flash_error errors

# TAB FUNCTIONALITY
  $('#myTab a').click (e) ->
    e.preventDefault()
    $(this).tab "show"

  $("a[data-toggle=\"tab\"]").on "shown.bs.tab", (e) ->
    e.target
    e.relatedTarget


#  CAROUSEL FUNCTIONALITY
  # $('.carousel').carousel({
  #   interval: 4000
  # });