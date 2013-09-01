$('#submit_form_button').keyup (event)->
  self = this
  clearTimeout self.timer if self.timer
  self.timer = setTimeout(->
    self.time = null
    tripName = $("#name").val()
    tripDescription = $("#description").val()
    tripCoverPhoto = $("#cover_photo").val()
    $.ajax
      type: "GET"
      url: "/"
      data:
        q: query
      success: render_results
      error: (xhr) ->
        errors = $.parseJSON(xhr.responseText).errors
        flash_error errors
  , 1000)