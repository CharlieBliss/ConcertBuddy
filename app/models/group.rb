class Group < ActiveRecord::Base
  belongs_to :event
  belongs_to :owner, class_name: :User
  has_many :users
  has_and_belongs_to_many :tags

  validates :event_id, numericality: true, presence: true
  validates :owner_id, numericality: true, presence: true
  validates :name, length:{maximum:  50}
  validates :size, numericality: true, presence: true



end