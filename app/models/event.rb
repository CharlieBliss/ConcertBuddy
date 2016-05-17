class Event < ActiveRecord::Base
  validates_uniqueness_of :event_id

  has_and_belongs_to_many :artists
  has_many :groups

  def has_groups
    self.groups.length > 0
  end

  def self.create_with_songkick(event)
      new_event = Event.create(
        url: event["uri"],
        title: event["displayName"],
        venue: event["venue"]["displayName"],
        event_id: event["id"],
        city: event["location"]["city"],
        latitude: event["location"]["lat"],
        longitude: event["location"]["lng"],
        time: event["start"]["time"],
        date: event["start"]["date"],
        artist_name: Songkick.headliner(event)
        )
        new_event
    end

end