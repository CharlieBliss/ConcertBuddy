$(document).ready(function(){
  var curr_page = 1
  $(".join-squad").on ("click", function(event){
    event.preventDefault();
    $.ajax({
      method: "GET",
      url: this.href
    }).done(function(response){
      $('.modal-body').html(response);
      $('#groups-modal').modal('show');
    });
  });

  $('#infinite-scrolling').on ('click', function(){

  });

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
});