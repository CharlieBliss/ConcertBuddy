require 'bcrypt'
class User < ActiveRecord::Base
  include BCrypt
  has_secure_password
  has_and_belongs_to_many :tags
  has_and_belongs_to_many :groups
  has_many :owned_groups, class_name: :Group, foreign_key: :owner_id

  validates :name, uniqueness: true, length: {maximum:  50}
  validates :email, uniqueness: true
  # format: {with: /\b[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}\b/, message: "Not a valid Email Address"}
  validates :about, length: {maximum: 500}

end