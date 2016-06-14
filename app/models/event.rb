class Event < ActiveRecord::Base
  validates_uniqueness_of :event_id

  has_and_belongs_to_many :artists
  has_many :groups

  def has_groups
    self.groups.length > 0
  end

  def self.create_with_songkick(event)
      new_event = Event.new(
        url: event["uri"],
        title: event["displayName"],
        venue: event["venue"]["displayName"],
        songkick_venue_id: event["venue"]["id"],
        event_id: event["id"],
        city: event["location"]["city"],
        latitude: event["location"]["lat"],
        longitude: event["location"]["lng"],
        time: event["start"]["time"],
        date: event["start"]["date"],
        )

        headliner = Songkick.headliner(event)
        if headliner
          new_event.songkick_artist_id = headliner["id"]
          new_event.artist_name = headliner["displayName"]
        end
        new_event.save
        new_event
    end

end