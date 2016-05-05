class Tag < ActiveRecord::Base
  has_and_belongs_to_many :users
  has_and_belongs_to_many :groups

  validates :title, presence: true, length: {maximum:  20}


end