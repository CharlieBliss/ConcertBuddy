class Tag < ActiveRecord::Base
  has_and_belongs_to_many :users

  validates :title, presence: true, length: 20


end