

$(document).ready(function(){

  if ($('#custom-search').length > 0){
    updateFormDates();
  };
  var applicationController = new ApplicationController();
  applicationController.init();
});

function updateFormDates(){
  var currDate = new Date();
  var endDate = new Date();
  endDate.setMonth(endDate.getMonth() + 1);
  var htmlFormatCurrDate = currDate.yyyymmdd();
  var htmlFormatEndDate = endDate.yyyymmdd();
  $('#start').val(htmlFormatCurrDate);
  $('#end').val(htmlFormatEndDate);
}

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