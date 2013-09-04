$ ->

  input = document.getElementById 'marker_address'
  options =
  autocomplete = new google.maps.places.Autocomplete input, options


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

    dataOptions =
      name: tripName
      description: tripDescription

    dataOptions.fileData = fileString if fileString != null

    $.ajax
      type: "POST"
      url: "/trips.json"
      data: dataOptions
      success: (data)->
        $("#create_trip_form").hide()
        $("#trip_info .name").text data.name
        $("#trip_info .description").text data.description
        if data.cover_photo.thumb.url?
          $("#trip_info .image").html("<img src='#{data.cover_photo.thumb.url}'>")
        $("#trip_info .image img").attr "src",
        $("#trip_id").val(data.id)
        $("#trip_info").show()
        $("#marker_info").show()
      error: (xhr) ->
        errors = $.parseJSON(xhr.responseText).errors
        if errors?
          flash_error errors


  $('#marker_photo').change (event)->
    filebase = event.target.files[0]
    reader = new FileReader();
    reader.onload = (e) ->
      fileString = e.target.result
    reader.readAsDataURL(filebase)


  $('#create_marker_form').submit (event)->
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

    #setting link to trip show
    $("#leave_trip_edition").attr "href", "/trips/#{markerTripId}"
    $.ajax
      type: "POST"
      url: "/markers.json"
      data: dataOptions
      success: (data)->
        fileString = null
        # add a new marker to the map
        markers_array = window.markers || []


        if (window.map != undefined)
          #TODO: loop over the markers and add to bounds

          newLatLng = new google.maps.LatLng(data.latitude, data.longitude)
          infowindow = new google.maps.InfoWindow
              maxWidth: 200
          marker = new google.maps.Marker
            position: newLatLng
            map: window.map
            icon: "/assets/markermap_icon.png"
            animation: google.maps.Animation.DROP

        # then recalculate the bounds of the map
          # window.map.fitBounds(bounds)
          window.map.bounds.extend marker.position
          window.map.fitBounds map.bounds

          paths = window.map.polyline.getPath()
          paths.push marker.position

        #then , if the marker is not the first one , draw a line between the differnerts martkers
          trip_path = new google.maps.Polyline
            path: markers_array
            strokeColor: "#7a2949"
            strokeWeight: 2




        $("#marker_name").val('')
        $("#marker_description").val('')
        $("#marker_address").val('')
        $("#longitude").val('')
        $("#latitude").val('')
        $("#marker_photo").val('')

      error: (xhr)->
        errors = $.parseJSON(xhr.responseText).errors
        if errors?
          flash_error errors




