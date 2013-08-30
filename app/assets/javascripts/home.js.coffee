$ ->

  render_results = (data)->
    $('#search_results_all').fadeIn(200);
    console.log(data)
    $('#search_results_all').append("<p>" + data + "</p>");

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