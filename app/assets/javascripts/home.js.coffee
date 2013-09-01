$ ->

# SEARCH FUNCTIONALITY
  render_results = (data)->
    $('#search_results_all').empty();
    $('#search_results_all').fadeIn(200);
    for user in data.users
      console.log(user)
      $('#search_results_all').append("<div id='result_line'><img src='/assets/user_icon.png' /><a href='/users/"+user.id+"'>"  + user.username+ "</a></div>");
    for trip in data.trips
      console.log(trip)
      $('#search_results_all').append("<div id='result_line'><img src='/assets/trip_icon.png' /><a href='/trips/"+trip.id+"'>"  + trip.name+ "</a></div>");
    for marker in data.markers
      console.log(marker)
      $('#search_results_all').append("<div id='result_line'><img src='/assets/marker_icon.png' /><a href='/markers/"+marker.id+"'>"  + marker.name+ "</a></div>");

  flash_error = (errors) ->
    $('#search_results_all').empty();
    $('#search_results_all').append("<p id='search_error'>"+errors+"</p>")
    $("#search_results_all").fadeIn(200).delay(3000).fadeOut(200)


  $('#submit_form_button').keyup (event)->
    self = this
    clearTimeout self.timer if self.timer
    self.timer = setTimeout(->
      self.time = null
      query = $("#q").val()
      $.ajax
        type: "GET"
        url: "/"
        data:
          q: query
        success: render_results
        error: (xhr) ->
          errors = $.parseJSON(xhr.responseText).errors
          flash_error errors
    , 500)

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



#  CAROUSEL FUNCTIONALITY
  # $('.carousel').carousel({
  #   interval: 4000
  # });