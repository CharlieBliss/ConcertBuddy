var ApplicationController = function(){
  this.events = []
  this.songkickController = new SongkickController(this)
  this.artistController = new ArtistController(this)
  this.mapController
};

ApplicationController.prototype = {

  init: function(){
    if ($('#posts').length > 0){
      this.songkickController.init();
      this.eventsIndexHandlers();
    };
    if ($('#map').length > 0){
      var lat = Number($('#coordinates').html().split("|")[0])
      var lon = Number($('#coordinates').html().split("|")[1])
      this.mapController = new MapController(this,lat,lon);
      this.mapController.initMap();
    };

  },

  addAndBuildEvents: function(events){
    this.events = [];
    for (var i = 0; i < events.length; i++ ){
      this.events.push(events[i]);
      if (i === events.length - 1){
        for (var i = 0; i < this.events.length; i++){
          this.artistController.createAndReturnArtist(this.events[i]);
        };
      };
    };
    this.songkickController.createAllDivs(this.events);
    // break out into own function
  },

  eventsIndexHandlers: function(){
    // custom search
    $(document).on ('submit', 'form#custom-search', function(){
      event.preventDefault();
      $.ajax({
        data: $(event.target).serialize(),
        url: "/songkick/custom_search",
        method: "get",
      }).done(function(response){
        // modal.style.display = "none";
        $('#posts').empty();
        this.addAndBuildEvents(response);
      }.bind(this));
    }.bind(this));

    // artist search
    $(document).on ('submit', 'form#artist-search', function(){
      event.preventDefault();
      $.ajax({
        data: $(event.target).serialize(),
        url: "/songkick/artist_search",
        method: "get",
      }).done(function(response){
        // modal.style.display = "none";
        $('#posts').empty();
        this.addAndBuildEvents(response);
      }.bind(this));
    }.bind(this));

    $(document).on ('submit', 'form#has-groups', function(){
      event.preventDefault();
      $.ajax({
        data: $(event.target).serialize(),
        url: "/events/has_groups",
        method: "get",
      }).done(function(response){
        // modal.style.display = "none";
        $('#posts').empty();
        this.addAndBuildEvents(response);
      }.bind(this));
    }.bind(this));


    // ajax to save new event and return form for a new group change to use id and not create, action to groups not events
    // $(document).on ('submit', 'form.create-group', function(){
    //   event.preventDefault();
    //   $.ajax({
    //     data: $(event.target).serialize(),
    //     url: "/events",
    //     method: "post"
    //   }).done(function(response){
    //     modal.style.display = "block";
    //     $('#inner-content').html(response);
    //   });
    // });

    $('#search-link').on ('click', function(){
      event.preventDefault();
      modalSearch.style.display = "block";
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
}

// bubble into event id$('#event#{event.id}')
