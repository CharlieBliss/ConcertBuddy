// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

    $(document).ready(function() {

        var token = 'WTN24GVVDJ63WWNPS3GY';
        var $events = $("#events");

        $.get('https://www.eventbriteapi.com/v3/events/search/?token='+token+'&venue.city=new+york&expand=venue', function(res) {
            if(res.events.length) {
              var slim_objects = [];
              for (var i = 0; i < res.events.length; i++){
                slim_objects.push(new Event(res.events[i]));
              };
              var slimJson = JSON.stringify(slim_objects);
              $.ajax({
                method: "POST",
                url: "/events/get_events",
                dataType: "json",
                data: slimJson
              }).done(function(response){
                response
              });
                var s = "<ul class='eventList'>";
                for(var i=0;i<res.events.length;i++) {
                    var event = res.events[i];
                    console.dir(event);
                    s += "<li><a href='" + event.url + "'>" + event.name.text + "</a> - " + event.description.text + "</li>";
                }
                s += "</ul>";
                $events.html(s);
            } else {
                $events.html("<p>Sorry, there are no upcoming events.</p>");
            }
        });


    });

function Event(obj) {
  this.id = obj.id;
  this.url = obj.url;
  this.name = obj.name.text;
  this.start = obj.start.local;
  this.address = obj.venue.address.address_1;
}


