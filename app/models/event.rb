class Event < ActiveRecord::Base
  validates_uniqueness_of :event_id

  has_and_belongs_to_many :users
  has_many :groups

  def has_groups
    self.groups.length > 0
  end

end