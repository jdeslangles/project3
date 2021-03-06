$ ->

# SEARCH FUNCTIONALITY
  render_results = (data)->
    $('#search_results_all').empty();
    $('#search_results_all').fadeIn(200);
    for trip in data.trips
      console.log(trip)
      $('#search_results_all').append("<div id='result_line'><img src='/assets/trip_icon.png' /><a href='/trips/"+trip.id+"'>"  + trip.name+ "</a><span id='trip_description'>" + '-  '  + trip.description+"</span></div>");
    for marker in data.markers
      console.log(marker)
      $('#search_results_all').append("<div id='result_line'><img src='/assets/marker_icon.png' /><a href='/markers/"+marker.id+"'>"  + marker.name+ "</a></div>");
    for user in data.users
      console.log(user)
      $('#search_results_all').append("<div id='result_line'><img src='/assets/user_icon.png' /><a href='/users/"+user.id+"'>"  + user.username+ "</a></div>");

  flash_error = (errors) ->
    $('#search_results_all').empty();
    $('#search_results_all').append("<p id='search_error'>"+errors+"</p>")
    $("#search_results_all").fadeIn(200).delay(3000).fadeOut(200)

  search = ->
    query = $("#q").val()
    $.ajax
      type: "GET"
      url: "/search"
      data:
        q: query
      success: render_results
      error: (xhr) ->
        errors = $.parseJSON(xhr.responseText).errors
        flash_error errors

  $('#submit_form_button').keyup (event)->
    self = this
    clearTimeout self.timer if self.timer
    self.timer = setTimeout(->
      self.time = null
      search()

    , 500)

  $('#submit_form_button').on "submit", (event) ->
    event.preventDefault()
    search()

  if($("#q").val().length> 0)
    search()

#  CAROUSEL FUNCTIONALITY
  $('.carousel').carousel
    interval: 8000

