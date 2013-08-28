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


  markers =
  i = 0
  while i < markers.length
    data = markers[i]
    myLatlng = new google.maps.LatLng(data.latitude, data.longitude)
    marker = new google.maps.Marker(
      position: myLatlng
      map: map
      title: data.name
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
