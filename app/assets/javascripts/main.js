$(document).ready(function(){
  var curr_page = 1
  getEvents();

  // limits the number of requests when scrolling down, infinite scroll
  $(window).bindWithDelay ('scroll', function(){
    if ($(window).scrollTop() > $(document).height() - $(window).height() - 60){
      curr_page = curr_page + 1;
      $.ajax({
        method: "get",
        data: {"page": curr_page},
        url: "http://localhost:3000/events"
      }).done(function(response){
      $('#infinite-scrolling').append(response);
      });
    };
  },100);

  // getLocation();

});

function getLocation(){
  if (navigator.geolocation) {
      navigator.geolocation.getCurrentPosition(getPosition);
  } else {
      x.innerHTML = "Geolocation is not supported by this browser.";
  }
}

function getPosition(position) {
  debugger
  var data = {lat: position.coords.latitude, lng: position.coords.longitude};
  $.ajax({
    data: data,
    method: "get",
    url: ""
  })
};

var getEvents = function(){
  $.ajax({
    method: "GET",
    url: "/songkick/events"
  }).done(function(response){
    debugger
  });
}

var createEventDiv = function(event){

}