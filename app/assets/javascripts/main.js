$(document).ready(function(){
  $(".join-squad").on ("click", function(event){
    event.preventDefault();
    var url_split = window.location.href.split("/");
    var dataPackage = {"event_id": url_split[url_split.length - 1] };
    $.ajax({
      method: "GET",
      data: dataPackage,
      url: this.href
    }).done(function(response){
      $('.modal-body').html(response);
      $('#groups-modal').modal('show');
    });
  });
});