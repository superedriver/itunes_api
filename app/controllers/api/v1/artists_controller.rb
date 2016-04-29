class Api::V1::ArtistsController < ApplicationController
  def index
    render json: {status: :ok, items: Artist.all}
  end
end
