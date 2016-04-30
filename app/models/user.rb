class User < ActiveRecord::Base
  has_and_belongs_to_many :tags
  has_and_belongs_to_many :groups
  has_many :groups, foreign_key: :owner_id

  validates
end