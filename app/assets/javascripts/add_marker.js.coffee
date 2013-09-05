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
    $("#trip_details").hide()

  $("#cancel_add_marker_link").click ->
    $("#add_marker_info").hide()
    $("#trip_details").show()

  $('#add_marker_form').submit (event)->
    console.log "TADAAA"
    event.preventDefault()
    markerName = $("#marker_name").val()
    markerDescription = $("#marker_description").val()
    markerAddress = $("#marker_address").val()
    markerTripId = $("#trip_id").val()

    dataOptions =
      marker:
        name: markerName
        description: markerDescription
        address: markerAddress
    dataOptions.fileData = fileString if fileString != null
    dataOptions.trip_id = markerTripId

    $.ajax
      type: "POST"
      url: "/markers.json"
      data: dataOptions
      success:->
        location.reload()
      error: (jqXHR, textStatus, errorThrown) ->
        for error, value of jqXHR.responseJSON
          alert "#{error} #{value}"
