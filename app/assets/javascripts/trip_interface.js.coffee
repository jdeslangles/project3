$('#create_trip_form_button').on "submit" (event)->
  event.preventDefault()
  tripName = $("#name").val()
  tripDescription = $("#description").val()
  # tripCoverPhoto = $("#cover_photo").val()
  $.ajax
    type: "POST"
    url: "/trip_interface"
    data:
      name: tripName
      description: tripDescription
      # cover_photo: tripCoverPhoto
    success:
    error: (xhr) ->
      errors = $.parseJSON(xhr.responseText).errors
      flash_error errors