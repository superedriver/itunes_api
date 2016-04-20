class AlbumsController < ApplicationController
  def index
    @artist = Artist.find_by(id: params["artist_id"])
    @albums = @artist ? @artist.albums : "The search has not given any results"
    render json: @albums
  end
end
