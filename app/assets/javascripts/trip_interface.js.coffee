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
    event.preventDefault()
    tripName = $("#name").val()
    tripDescription = $("#trip_description").val()
    $.ajax
      type: "POST"
      url: "/trips.json"
      data:
        name: tripName
        description: tripDescription
        fileData: fileString
      success: (data)->
        $("#create_trip_form").hide()
        $("#trip_info .name").text data.name
        $("#trip_info .description").text data.description
        $("#trip_info .image img").attr "src", data.cover_photo.thumb.url
        $("#trip_id").val(data.id)
        $("#trip_info").show()
        $("#marker_info").show()
      error: (xhr) ->
        errors = $.parseJSON(xhr.responseText).errors
        if errors?
          flash_error errors

  $('#create_marker_form').submit (event)->
    console.log "TADAAA"
    event.preventDefault()
    markerName = $("#marker_name").val()
    markerDescription = $("#marker_description").val()
    markerAddress = $("#marker_address").val()
    markerTripId = $("#trip_id").val()

    #setting link to trip show
    $("#leave_trip_edition").attr "href", "/trips/#{markerTripId}"
    $.ajax
      type: "POST"
      url: "/markers.json"
      data:
        marker:
          name: markerName
          description: markerDescription
          address: markerAddress
        trip_id: markerTripId
      success: ->
        # add a new marker to the map
        if ($("#googleMap").length > 0)
          mapOptions =
            zoom: 2
            center: new google.maps.LatLng($("#latitude").val(), $("#longitude").val())
            scrollwheel: false
          infowindow = new google.maps.InfoWindow
              maxWidth: 200
          console.log(mapOptions)
        # then recalculate the bounds of the map

        #then , if the marker is not the first one , draw a line between the differnerts martkers


        $("#marker_name").val('')
        $("#marker_description").val('')
        $("#marker_address").val('')
        $("#longitude").val('')
        $("#latitude").val('')
      error: (xhr)->
        errors = $.parseJSON(xhr.responseText).errors
        if errors?
          flash_error errors




