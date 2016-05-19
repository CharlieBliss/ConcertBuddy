var MapController = function(applicationController,latitude, longitude){
  this.latitude = latitude
  this.longitude = longitude
  this.parent = applicationController
  this.placeObject
};

MapController.prototype = {
  initMap: function() {
    var mapDiv = document.getElementById('map');

    if (typeof(this.placeObject) === "object"){
      this.latitude = Number(this.placeObject.latitude);
      this.longitude = Number(this.placeObject.longitude);
    };

    debugger

    var venueLocation = {lat: this.latitude, lng: this.longitude}
    var map = new google.maps.Map(mapDiv, {
      center: venueLocation,
      zoom: 15
    });

    var marker = new google.maps.Marker({
      position: venueLocation,
      map: map
    });
  },

  contentBuilder: function(){
    if (typeOf(placeObject) === "object"){
      return fullContentWindow();
    };
  },

  fullContentWindow: function(){
    var htmlArray = [];
    htmlArray.push("<h6>address: " + this.address + "</h6");
    htmlArray.push("<h6>rating:" + this.rating + "</h6");
    htmlArray.push("<h6>total ratings:" + this.total_ratings + "</h6");
    htmlArray.push("<h6>phone: " + this.phone + "</h6");
    htmlArray.push("<h6><a href=" + this.google_url + ">view on google</h6");
    return htmlArray.join("");
  }
};

