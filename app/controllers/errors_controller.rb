class ErrorsController < ApplicationController
  def catch_404
    render json:  'Wrong URL', status: 404
  end
end
