class Api::V1::ArtistsController < ApplicationController
  def index
    returned_data = {}
    returned_data[:status] = "ok"
    returned_data[:message] = "Artists"
    returned_data[:items] = Artist.all
    render json: returned_data
  end
end
