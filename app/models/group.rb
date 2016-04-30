class Group < ActiveRecord::Base
  belongs_to :event
  belongs_to :owner, class_name: :user
  has_many :users


end