$ ->
  # latitude = $("#latitude span").text()
  # longitude = $("#longitude span").text()
  mapOptions =
    zoom: 10
    center: new google.maps.LatLng(latitude, longitude)
    mapTypeId: google.maps.MapTypeId.ROADMAP
    scrollwheel: false

  canvas = document.getElementById("googleMap")
  window.map = map = new google.maps.Map(canvas, mapOptions)

  # marker = new google.maps.Marker
  #   position: mapOptions.center
  #   map: map

  i = 0
  while i < markers.length
    data = markers[i]
    myLatlng = new google.maps.LatLng(data.lat, data.lng)
    marker = new google.maps.Marker(
      position: myLatlng
      map: map
      title: data.title
    )
    i++


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
