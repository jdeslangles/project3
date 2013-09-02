$ ->

# MULTIPLE MAPS ON USER PAGE

# sets multiple maps on user page
  if $('#user_trips').length > 0
    mapOptions =
      zoom: 1
      center: new google.maps.LatLng(0, 0)
      mapTypeId: google.maps.MapTypeId.ROADMAP
      scrollwheel: false

    user_id = $("body").attr("data-user-id")

    $.getJSON "/users/" + user_id + "/trips.json", (data) ->
      for trip in data
        mapElement = $('<div class="map_user_profile" id="map_' + trip.id + '">')
        $('#trip_' + trip.id).append(mapElement)
        nativeMapElement = document.getElementById("map_" +trip.id)
        map = new google.maps.Map(nativeMapElement, mapOptions)
        bounds = new google.maps.LatLngBounds()
        latlngs = []
        for marker in trip.markers
          marker_position = new google.maps.LatLng marker.latitude, marker.longitude
          marker = new google.maps.Marker
            position: marker_position
            map: map
            # icon: "marker_icon.png"
          bounds.extend(marker_position)
          latlngs.push marker_position

        map.fitBounds(bounds)
        trip_path = new google.maps.Polyline
          path: latlngs
          strokeColor: "#7c2849"
          strokeWeight: 2
        trip_path.setMap map



# UNIQUE MAP ON TRIP INTERFACE AND INDIVIDUAL MAP

# sets map options
  if $("#googleMap").length > 0
    mapOptions =
      zoom: 1
      center: new google.maps.LatLng(0, 0)
      mapTypeId: google.maps.MapTypeId.ROADMAP
      scrollwheel: false

    canvas = document.getElementById("googleMap")
    map = new google.maps.Map(canvas, mapOptions)

  # draws markers on map through a loop
    draw_markers = ->
      for marker in window.markers
        image = "/assets/markermap_icon.png"
        myLatLng = new google.maps.LatLng(marker.latitude, marker.longitude)
        marker = new google.maps.Marker
          position: myLatLng
          map: map
          icon: image
          # title: marker.name
        bounds.extend(myLatLng)
        myLatLng

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


# # user_profile_maps
#   map_elements = $(".map_user_profile")
#   for map_div in map_elements
#     console.log map_div
#     mapOptions =
#       zoom: 10
#       center: new google.maps.LatLng(0, 0)
#       mapTypeId: google.maps.MapTypeId.ROADMAP
#       scrollwheel: false

#     canvas = document.getElementById("googleMap")
#     map = new google.maps.Map(canvas, mapOptions)

#     # draws markers on map through a loop
#     draw_markers = ->
#       trip_markers = $(".trip_markers")
#       for trip in trip_markers
#         console.log trip
#         for marker in window.trip
#           myLatLng = new google.maps.LatLng(marker.latitude, marker.longitude)
#           marker = new google.maps.Marker
#             position: myLatLng
#             map: map
#             title: marker.name
#           bounds.extend(myLatLng)
#           myLatLng

#     # sets boundaries of the maps
#     bounds = new google.maps.LatLngBounds
#     map.fitBounds(bounds)

#     # draws line to each marker
#     trip_stops = draw_markers()
#     trip_path = new google.maps.Polyline
#       path: trip_stops
#       strokeColor: "#7c2849"
#       strokeWeight: 2

#     trip_path.setMap map




#   #   $(function(){
#   #   var mapOptions,
#   #         canvas,
#   #         map;
#   #   var latitude = $("#latitude span").text();
#   #   var longitude = $("#longitude span").text();

#   # //default map display
#   #   mapOptions = {
#   #     zoom: 10,
#   #     center: new google.maps.LatLng(latitude, longitude),
#   #     mapTypeId: google.maps.MapTypeId.ROADMAP
#   #   };
