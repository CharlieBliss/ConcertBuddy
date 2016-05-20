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
      // should probably be an events view
      this.parent.addAndBuildEvents(response);
    }.bind(this));
  },

  newGroupFormBuilder: function(show){
    var button = "<button type='submit' class='btn btn-large btn-success'>Looking for a Group?</button>"
    var form = "<form class='create-group' action='events/" + show.id + "/groups/new'><input type='hidden' name=show[id] value=" + show.id + ">" + button + "</form>";
    return form;
  },

  createAllDivs: function(objects){
    for (var i = 0; i < objects.length; i++){
      $('#posts').append(this.createEventDiv(objects[i]));
    };
  },

  createEventDiv: function(show){
    var show = show;
    var form = this.newGroupFormBuilder(show);
    var time = this.hasTime(show);
    var div = "<div class='event col-lg-4' id='event" + show.id + "''><a href='/events/" + show.id + "'><img src=" + "http://www.exaclair.com/images/placeholders/team-placeholder.jpg" + " class='event-image'></a><div class='content'><p><h3><a href='/events/" + show.id + "'>" + show.artist_name + "</a><h3> | " + show.date + " " + stringToTime(time) + "</p><p class='show-venue'>" + show.venue + "</p>" +  form + "</div></div>";
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
