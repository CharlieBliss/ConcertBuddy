class ArtistsController < ApplicationController

  def create
      event = Event.find(params[:event_id])

      if event.searched_for_artist
        render json: event.artists.first
      else
        artist = Artist.find_or_create(params[:artist])
        event.artists << artist if artist
        event.update_attributes(searched_for_artist: true)
        render json: artist
      end

  end

  def show
    # show short bio of artist and all upcoming shows
    # @artist.events
  end
end
