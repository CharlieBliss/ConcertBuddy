// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
var SongkickController = function(applicationController){
  this.parent = applicationController
};

SongkickController.prototype = {

   init: function(){
    this.getInitialEvents();
   },
  // initial pull of events
   getInitialEvents: function(){
    $.ajax({
      method: "GET",
      url: "/songkick/events"
    }).done(function(response){
      this.parent.addAndBuildEvents(response);
    }.bind(this))
  },

  moreInfoButton: function(show){

    var button = "<div class='centered'><a href='events/" + show.id + "'><button type='button' class='btn btn-large btn-success'>More Info</button>"
    return button;
  },

  createAllDivs: function(objects){
    for (var i = 0; i < objects.length; i++){
      $('#posts').append(this.createEventDiv(objects[i]));
    };
  },

  createEventDiv: function(show){
    var show = show;
    var form = this.moreInfoButton(show);
    var time = this.hasTime(show);
    var div = "<div class='event col-lg-4' id='event" + show.id + "''>";
    div = div + "<h3><a href='/events/" + show.id + "'>" + show.artist_name + "</a></h3>";
    div = div + "<a href='/events/" + show.id + "'><div class='centered' id='event'" + show.id + "><img src=" + "http://www.exaclair.com/images/placeholders/team-placeholder.jpg" + " class='event-image'></div></a>";
    div = div + "<div class='content'>";
    div = div + "<p class='show-date'>" + show.date + " " + stringToTime(time) + "</p>";
    div = div + "<p class='show-venue'>" + show.venue + "</p>" +  form + "</div></div>";
    return div;
  },

  hasTime: function(show){
    if (show.time){
      return show.time;
    };
    return "";
  },

  hasGroups: function(show_array){
    var string = "";
    if (show_array[1] === true){
      string = "<h6><a href=/events/" + show_array[0].id + "/groups>Show groups going</a></h6>"
    }
    return string;
  },

  createEventModal: function(event){

  }
}
