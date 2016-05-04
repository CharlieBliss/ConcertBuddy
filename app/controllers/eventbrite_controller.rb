class EventbriteController < ApplicationController

  def events
    token = current_user.token
    binding.pry
    Eventbrite.new(token)
  end
end
