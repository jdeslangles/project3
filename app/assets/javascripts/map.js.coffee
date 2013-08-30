# sets map options
$ ->
  if $("#googleMap").length > 0
    mapOptions =
      zoom: 2
      center: new google.maps.LatLng(0, 0)
      mapTypeId: google.maps.MapTypeId.ROADMAP
      scrollwheel: false

    canvas = document.getElementById("googleMap")
    map = new google.maps.Map(canvas, mapOptions)

  # draws markers on map through a loop
    draw_markers = ->
      for marker in window.markers
        myLatLng = new google.maps.LatLng(marker.latitude, marker.longitude)
        marker = new google.maps.Marker
          position: myLatLng
          map: map
          title: marker.name
        bounds.extend(myLatLng)
        myLatLng

   # sets boundaries of the maps
    bounds = new google.maps.LatLngBounds
    map.fitBounds(bounds)

  # draws line to each marker
    trip_stops = draw_markers()
    trip_path = new google.maps.Polyline
      path: trip_stops
      strokeColor: "#7c2849"
      strokeWeight: 2

    trip_path.setMap map






  #   $(function(){
  #   var mapOptions,
  #         canvas,
  #         map;
  #   var latitude = $("#latitude span").text();
  #   var longitude = $("#longitude span").text();

  # //default map display
  #   mapOptions = {
  #     zoom: 10,
  #     center: new google.maps.LatLng(latitude, longitude),
  #     mapTypeId: google.maps.MapTypeId.ROADMAP
  #   };
