class Api::V1::AlbumsController < ApplicationController
  def index
    # if(params["artist_id"])
    # binding.pry
    @artist = Artist.find_by(id: params["artist_id"])
    @albums = @artist.present? ? @artist.albums : "The search has not given any results"
    render json: @albums
  end
end
