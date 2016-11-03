function initMap() {
  var tree = {lat: treeLat, lng: treeLng};
  var map = new google.maps.Map(document.getElementById('map'), {
    zoom: 13,
    center: tree
  });
  var marker = new google.maps.Marker({
    position: tree,
    map: map
  });
}
