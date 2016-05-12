$(document).ready(function(){
  getInitialEvents();
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

// fix to close by class not id
  var modal = document.getElementById('myModal');
  var modalSearch = document.getElementById('search');
  var span1 = document.getElementById("spanClose1");
  var span2 = document.getElementById("spanClose2");
  var searchModal = document.getElementById('search');
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

  $('#search-link').on ('click', function(){
    event.preventDefault();
    modalSearch.style.display = "block";
  });

  span1.onclick = function() {
      modal.style.display = "none";
  };

  span2.onclick = function() {
      modalSearch.style.display = "none";
  };

  window.onclick = function(event) {
    if (event.target == modal || event.target == modalSearch) {
        modalSearch.style.display = "none";
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