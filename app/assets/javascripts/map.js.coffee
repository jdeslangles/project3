$ ->
  latitude = $("#latitude span").text()
  longitude = $("#longitude span").text()
  mapOptions =
    zoom: 10
    center: new google.maps.LatLng(latitude, longitude)
    mapTypeId: google.maps.MapTypeId.ROADMAP
    scrollwheel: false

  canvas = document.getElementById("googleMap")
  window.map = map = new google.maps.Map(canvas, mapOptions)

  marker = new google.maps.Marker
    position: mapOptions.center
    map: map


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
