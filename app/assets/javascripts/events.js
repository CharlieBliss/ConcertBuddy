// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

    $(document).ready(function() {

        var token = 'WTN24GVVDJ63WWNPS3GY';
        var $events = $("#events");

        $.get('https://www.eventbriteapi.com/v3/events/search/?token='+token+'&venue.city=new+york&expand=venue', function(res) {
            if(res.events.length) {
              debugger
              $.ajax({
                method: "POST",
                url: "/events/create",
                dataType: "json"
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
  this.city = obj.venue.address.city;
  this.latitude = obj.venue.address.latitude;
  this.longitude = obj.venue.address.longitude;
  this.html = obj.description.html;
  this.text = obj.description.text
}


