require "rails_helper"

RSpec.describe ArtistsController, type: :controller do
  describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
      get :index
      # get v1_0_artists_path
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "loads all of the posts into @posts" do
      artist1, artist2 = create(:artist), create(:artist)
      get :index
      puts "===================================="
      puts response.body
      expect(assigns(:posts)).to match_array([artist1, artist2])
      # expect(response.body).to match_array([artist1, artist1])
    end
  end
end