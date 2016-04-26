require "rails_helper"

RSpec.describe ArtistsController, type: :controller do
  describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
      get :index
      # get v1_0_artists_path
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "without artists" do
      get :index
      result = JSON.parse(response.body)
      expect(result.length).to eq(0)
    end

    it "loads all of the artists" do
      artist1 = create(:artist, name: "Mocart")
      artist2 = create(:artist)
      get :index
      result = JSON.parse(response.body)
      expect(result.length).to eq(2)
      expect(result[0]).to include("name" => "Mocart", "itunes_id" => 1)
      expect(result[1]).to include("name" => "Bach", "itunes_id" => 2)
    end
  end
end