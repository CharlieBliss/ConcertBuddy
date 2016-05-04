class EventbriteController < ApplicationController

  def events
    token = current_user.token
    api_info = Eventbrite.new(token)
    api_info.create_events
    redirect_to root_path
  end
end
