class Api::V1::AlbumsController < ApplicationController
  def index
    returned_data = {}

    @artist = Artist.find_by(id: params["artist_id"])

    if @artist.present?
      returned_data[:status] = "ok"
      returned_data[:message] = "#{@artist.name} albums"
      returned_data[:items] = @artist.albums
      render json: returned_data
    else
      returned_data[:status] = "error"
      returned_data[:message] = "Artist not found"
      returned_data[:items] = []
      render json: returned_data, status: 404
    end
  end
end
