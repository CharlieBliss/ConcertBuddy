// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
var getEvents = function(){
  $.ajax({
    method: "GET",
    url: "/songkick/events"
  }).done(function(response){
    createAllDivs(response);
  });
}

var newGroupFormBuilder = function(show){
  var form = "<form class='create-group' action='events' method='post'><input type='hidden' name=show[title] value=" + show.title + "><input type='hidden' name=show[url] value='" + show.url + "'><input type='hidden' name=show[venue] value=" + show.venue + "><input type='hidden' name=show[event_id] value=" + show.event_id + "><input type='hidden' name=show[city] value='" + show.city + "'><input type='hidden' name=show[latitude] value=" + show.latitude + "><input type='hidden' name=show[longitude] value=" + show.longitude + "><input type='hidden' name=show[time] value='" + show.time + "'><input type='hidden' name=show[date] value=" + show.date + "><input type='submit' value='looking for a group?'></form>";
  return form;
}

var createEventDiv = function(show_array){

  var show = show_array[0]
  var form = newGroupFormBuilder(show)
  var groupShow = hasGroups(show_array)
  debugger
  var div = "<div class='jumbotron container-fluid'><div class='col-md-6 jumbotext'><h2><a href=" + show.url + ">" + show.title + "</a></h2><h3>" + show.date + "</h3>" + form + groupShow + "</div></div>";
  return div;
}

var hasGroups = function(show_array){
  var string = "";
  debugger
  if (show_array[1] === true){
    string = "<h3><a href=/events/" + show_array[0].id + "/groups>Show groups going</a></h3>"
  }
  return string;
}

var createEventModal = function(event){
  //
}

var createAllDivs = function(objects){
  for (var i = 0; i < objects.length; i++){
    $('#posts').append(createEventDiv(objects[i]));
  };
}

