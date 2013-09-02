$ ->
  fileString = null
  fileAsString: ->
    fileReader.readAsDataURL( fileObject )
  $('#trip_cover_photo').change (event)->
    filebase = event.target.files[0]
    reader = new FileReader();
    reader.onload = (e) ->
      fileString = e.target.result
    reader.readAsDataURL(filebase)
  $('#create_trip_form').submit (event)->
    console.log "fgadfad"
    event.preventDefault()
    tripName = $("#name").val()
    tripDescription = $("#trip_description").val()
    # tripCoverPhoto = $("#cover_photo").val()
    $.ajax
      type: "POST"
      url: "/trips.json"
      data:
        name: tripName
        description: tripDescription
        fileData: fileString
        # cover_photo: tripCoverPhoto
      success: (data)->

        $("#create_trip_form").hide()
        $("#trip_details .name").text data.name
        $("#trip_details .description").text data.description
        $("#trip_details .image img").attr "src", data.cover_photo.thumb.url
        $("#trip_details").show()
      error: (xhr) ->
        errors = $.parseJSON(xhr.responseText).errors
        if errors?
          flash_error errors