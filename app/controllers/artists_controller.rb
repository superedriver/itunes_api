class ArtistsController < ApplicationController
  #
  # def search
  # end
  def index
    binding.pry
    @artists = Artist.all
  end
end
