class Message < ActiveRecord::Base

  belongs_to :user
  belongs_to :group

  validates :content, length: {minimum: 2}

end
