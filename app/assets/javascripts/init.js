$(document).ready(function(){
  getEvents();
  eventHandlers();
});

function getLocation(){
  if (navigator.geolocation) {
      navigator.geolocation.getCurrentPosition(getPosition);
  } else {
      x.innerHTML = "Geolocation is not supported by this browser.";
  }
}

function getPosition(position) {
  // debugger
  var data = {lat: position.coords.latitude, lng: position.coords.longitude};
  $.ajax({
    data: data,
    method: "get",
    url: ""
  })
};

function createGroupModal() {

}

function eventHandlers() {

  var modal = document.getElementById('myModal');
  var span = document.getElementById("spanClose");
  // ajax to save new event and return form for a new group
  $(document).on ('submit', 'form.create-group', function(){
    event.preventDefault();
    $.ajax({
      data: $(event.target).serialize(),
      url: "/events",
      method: "post"
    }).done(function(response){
      modal.style.display = "block";
      $('#inner-content').html(response);
    });
  });

  span.onclick = function() {
      modal.style.display = "none";
  };

  window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    };
  };

}




// for eventbrite, get working for songkick
// function infiniteScroll(){
//   var curr_page = 1
//   $(window).bindWithDelay ('scroll', function(){
//     if ($(window).scrollTop() > $(document).height() - $(window).height() - 60){
//       curr_page = curr_page + 1;
//       $.ajax({
//         method: "get",
//         data: {"page": curr_page},
//         url: "http://localhost:3000/events"
//       }).done(function(response){
//       $('#infinite-scrolling').append(response);
//       });
//     };
//   },100);
// }