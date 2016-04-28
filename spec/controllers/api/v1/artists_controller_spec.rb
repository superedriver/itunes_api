require 'rails_helper'

RSpec.describe Api::V1::ArtistsController, type: :controller do
  describe "GET #index" do
    before do
      get :index
    end

    it "responds successfully with an HTTP 200 status code" do
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "without artists" do
      result = JSON.parse(response.body)
      expect(result.length).to eq(0)
    end

    describe "with artists" do
      before do
        @artist1 = create(:artist, name: "Mocart")
        @artist2 = create(:artist)
        get :index
        @result = JSON.parse(response.body)
      end

      it "loads all of the artists" do
        expect(@result.length).to eq(2)
        expect(@result[0]).to include("name" => @artist1[:name])
        expect(@result[1]).to include("name" => @artist2[:name])
      end
    end
  end
end
