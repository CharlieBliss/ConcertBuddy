class User < ActiveRecord::Base

  has_and_belongs_to_many :tags
  has_and_belongs_to_many :groups
  has_many :owned_groups, class_name: :Group, foreign_key: :owner_id

  validates :email, uniqueness: true
  # format: {with: /\b[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}\b/, message: "Not a valid Email Address"}
  validates :about, length: {maximum: 500}

  def self.sign_in_from_omniauth(auth)
    find_by(provider: auth['provider'], uid: auth['uid']) || create_user_from_omni_auth(auth)
  end

  def self.create_user_from_omni_auth(auth)
    create(
      provider: auth[:provider],
      uid: auth[:uid],
      name: auth[:info][:name],
      email: auth[:info][:email],
      token: auth[:credentials][:token]
      )
  end

end