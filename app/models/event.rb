class Event < ActiveRecord::Base
  validates_uniqueness_of :event_id

  has_and_belongs_to_many :users
  has_many :groups

end