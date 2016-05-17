var MapController = function(applicationController,latitude, longitude){
  this.latitude = latitude
  this.longitude = longitude
  this.parent = applicationController
};

MapController.prototype = {
  initMap: function() {
    var mapDiv = document.getElementById('map');
    var venueLocation = {lat: this.latitude, lng: this.longitude}
    var map = new google.maps.Map(mapDiv, {
      center: venueLocation,
      zoom: 15
    });

    var marker = new google.maps.Marker({
      position: venueLocation,
      map: map
    });
  }
};