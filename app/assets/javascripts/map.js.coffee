$ ->
  latitude = $("#latitude span").text()
  longitude = $("#longitude span").text()
  mapOptions =
    zoom: 10
    center: new google.maps.LatLng(latitude, longitude)
    mapTypeId: google.maps.MapTypeId.ROADMAP

  canvas = document.getElementById("googleMap")
  window.map = map = new google.maps.Map(canvas, mapOptions)


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

#   canvas = document.getElementById("googleMap");
#   map = new google.maps.Map(canvas, mapOptions);

# });