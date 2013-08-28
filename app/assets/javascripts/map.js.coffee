$ ->
  # latitude = $("#latitude span").text()
  # longitude = $("#longitude span").text()
  mapOptions =
    zoom: 10
    center: new google.maps.LatLng(10, 106)
    mapTypeId: google.maps.MapTypeId.ROADMAP
    scrollwheel: false

  canvas = document.getElementById("googleMap")
  map = new google.maps.Map(canvas, mapOptions)


  for marker in window.markers
    myLatlng = new google.maps.LatLng(marker.latitude, marker.longitude)
    new google.maps.Marker
      position: myLatlng
      map: map
      title: marker.name
    console.log marker



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
