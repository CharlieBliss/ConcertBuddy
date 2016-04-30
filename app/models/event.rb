class Event < ActiveRecord::Base
  # validates :title, :location, presence: true

  has_and_belongs_to_many :users
  has_many :groups
end