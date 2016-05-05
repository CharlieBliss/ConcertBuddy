class Event < ActiveRecord::Base
  # validates :title, :location, presence: true
  validates_uniqueness_of :eventbrite_id

  has_and_belongs_to_many :users
  has_many :groups
end