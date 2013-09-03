$ ->
  fileString = null
  fileAsString: ->
    fileReader.readAsDataURL( fileObject )

  $('#marker_photo').change (event)->
    filebase = event.target.files[0]
    reader = new FileReader();
    reader.onload = (e) ->
      fileString = e.target.result
    reader.readAsDataURL(filebase)

  $("#add_another_marker_link").click ->
    $("#add_marker_info").show()

  $('#add_marker_form').submit (event)->
    console.log "TADAAA"
    event.preventDefault()
    markerName = $("#marker_name").val()
    markerDescription = $("#marker_description").val()
    markerAddress = $("#marker_address").val()
    markerTripId = $("#trip_id").val()

    $.ajax
      type: "POST"
      url: "/markers.json"
      data:
        marker:
          name: markerName
          description: markerDescription
          address: markerAddress
        fileData: fileString
        trip_id: markerTripId
      success:->
        location.reload()