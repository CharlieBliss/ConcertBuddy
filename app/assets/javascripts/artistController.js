var ArtistController = function(applicationController){
  this.parent = applicationController
}

ArtistController.prototype = {

  createAndReturnArtist: function(show){
    var show_id = show.id;
    var dataPackage = {
      event_id: show.id,
      artist: show.artist_name
    };
    $.ajax({
      method: "POST",
      url: "/artists",
      data: dataPackage,
      type: "json"
    }).done(function(response){

      var event_id = this.data.match(/event_id=([0-9]*)/)[1];
      if (response !== null && response.image_url.length > 0){
        debugger
        $('#event' + event_id).children('a').children('.centered').children('img').attr('src',response.image_url)
      };
    }).fail(function(response){
    });
  },
}
