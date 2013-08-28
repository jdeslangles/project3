$ ->
  mapOptions =
    zoom: 10
    # center: new google.maps.LatLng(10, 106)
    mapTypeId: google.maps.MapTypeId.ROADMAP
    scrollwheel: false

  canvas = document.getElementById("googleMap")
  map = new google.maps.Map(canvas, mapOptions)

  bounds = new google.maps.LatLngBounds
  for marker in window.markers
    myLatLng = new google.maps.LatLng(marker.latitude, marker.longitude)
    new google.maps.Marker
      position: myLatLng
      map: map
      title: marker.name
    bounds.extend(myLatLng)
    map.fitBounds(bounds)


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
