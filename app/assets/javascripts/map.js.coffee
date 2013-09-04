infowindow = null

$ ->

# MULTIPLE MAPS ON USER PAGE

# sets multiple maps on user page
  if ($("#user_trips").length > 0)
    mapOptions =
      zoom: 1
      center: new google.maps.LatLng(0, 0)
      mapTypeId: google.maps.MapTypeId.ROADMAP
      scrollwheel: false

    user_id = $("body").attr("data-user-id")

    $.getJSON "/users/" + user_id + "/trips.json", (data) ->
      for trip in data
        mapElement = $("<div class='map_user_profile' id='map_" + trip.id + "'>")
        $('#trip_' + trip.id).append(mapElement)
        nativeMapElement = document.getElementById("map_" +trip.id)
        map = new google.maps.Map(nativeMapElement, mapOptions)
        bounds = new google.maps.LatLngBounds()
        latlngs = []
        image = "/assets/markermap_mini_icon.png"
        for marker in trip.markers
          marker_position = new google.maps.LatLng marker.latitude, marker.longitude
          marker = new google.maps.Marker
            position: marker_position
            map: map
            icon: image
          bounds.extend(marker_position)
          latlngs.push marker_position

        map.fitBounds(bounds)
        trip_path = new google.maps.Polyline
          path: latlngs
          strokeColor: "#7c2849"
          strokeWeight: 2
        trip_path.setMap map



# UNIQUE MAP ON TRIP INTERFACE AND INDIVIDUAL MAP

# sets map options for trip interface
  if ($("#googleMap").length > 0)

    mapOptions =
      zoom: 2
      center: new google.maps.LatLng(0, 0)
      mapTypeId: google.maps.MapTypeId.ROADMAP
      scrollwheel: false

    canvas = document.getElementById("googleMap")
    window.map = map = new google.maps.Map(canvas, mapOptions)
    window.map.bounds = new google.maps.LatLngBounds()
    window.map.coords = []

    window.map.polyline = new google.maps.Polyline
      path: []
      strokeColor: '#FF0000'
      strokeOpacity: 1.0
      strokeWeight: 2

    window.map.polyline.setMap map

    infowindow = new google.maps.InfoWindow
      maxWidth: 200

  # draws markers on map through a loop
    draw_markers = ->
      markers_array = window.markers || []
      for marker in markers_array
        image = "/assets/markermap_icon.png"
        myLatLng = new google.maps.LatLng(marker.latitude, marker.longitude)
        marker_details = "<h2 id='infowindow'>#{marker.name}</h2><p id='infowindow_description'>#{marker.description.split(' ').slice(0,15).join(' ')}... <div id='infowindow_link'><a href='/markers/#{(marker.id)}'>read full post >> </a></div></p>"
        marker = new google.maps.Marker
          position: myLatLng
          map: map
          icon: image
          animation: google.maps.Animation.DROP
          title: marker_details

        paths = window.map.polyline.getPath()
        paths.push marker.position

        google.maps.event.addListener marker, "click", ->
          infowindow.setContent this.title
          infowindow.open map, this

        bounds.extend(myLatLng)
        myLatLng

    if markers?
     # sets boundaries of the maps
      bounds = new google.maps.LatLngBounds
      map.fitBounds(bounds)

    # draws line to each marker
      trip_stops = draw_markers()
      trip_path = new google.maps.Polyline
        path: trip_stops
        strokeColor: "#7a2949"
        strokeWeight: 2

      trip_path.setMap map


  if ($("#googleMap_marker").length > 0)
    latitude = $("#latitude").text()
    longitude = $("#longitude").text()
    mapOptions =
      zoom: 8
      center: new google.maps.LatLng(latitude, longitude)
      mapTypeId: google.maps.MapTypeId.ROADMAP
      scrollwheel: false

    canvas = document.getElementById("googleMap_marker")
    window.map = map = new google.maps.Map(canvas, mapOptions)
    image = "/assets/markermap_icon.png"
    myLatLng = new google.maps.LatLng(latitude, longitude)
    marker = new google.maps.Marker
      position: myLatLng
      map: map
      icon: image
      animation: google.maps.Animation.DROP



