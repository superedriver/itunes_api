class Api::V1::AlbumsController < ApplicationController
  def index

    @artist = Artist.find_by(id: params["artist_id"])

    if @artist.present?
      render json: {status: :ok, items: @artist.albums}
    else
      render json: {status: :error, message: 'Not Found', items: []}, status: 404
    end
  end
end
