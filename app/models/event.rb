class Event < ActiveRecord::Base
  validates :title, :location, presence: true
end