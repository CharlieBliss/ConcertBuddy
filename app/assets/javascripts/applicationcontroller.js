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
      var name = $('#event-name').text();
      var lat = Number($('#coordinates').html().split("|")[0])
      var lon = Number($('#coordinates').html().split("|")[1])
      $.ajax({
        data: {name: name, latitude: lat, longitude: lon },
        url: "/venues/search",
        method: 'get'
      }).done(function(response){
        this.mapController = new MapController(this);
        this.mapController.placeObject = response;
        this.mapController.initMap();
      }.bind(this)).fail(function(){
        var lat = Number($('#coordinates').html().split("|")[0])
        var lon = Number($('#coordinates').html().split("|")[1])
        this.mapController = new MapController(this, lat, lon);
        this.mapController.initMap();
      });
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
    var modal = $('#showModal')
    var span = $('#spanClose')

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


    $(document).on ('click', '.event a', function(){
      event.preventDefault();
      $.ajax({
        url: $(this).attr('href'),
        method: "get"
      }).done(function(response){
        debugger
        modal.show();
        $('#inner-content').html(response)
      });
    });

    $('#search-link').on ('click', function(){
      event.preventDefault();
      modalSearch.style.display = "block";
    });

    $('#spanClose').on ('click', function(){
      modal.hide();
    });

    $(document).on ('click', function(event) {
      if (event.target == modal[0]) {
          modal.hide();
      };
    });
  }
}

// bubble into event id$('#event#{event.id}')
