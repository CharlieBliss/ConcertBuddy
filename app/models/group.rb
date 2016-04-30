class Group < ActiveRecord::Base
  belongs_to :event
  belongs_to :owner, class_name: :user
  has_many :users

  validates :event_id, numericality: true, presence: true
  validates :owner_id, numericality: true, presence: true
  validates :name, length: 50
  validates :size, numericality: true, presence: true



end