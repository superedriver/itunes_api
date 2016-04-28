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
      expect(result["status"]).to eq("ok")
      expect(result["message"]).to eq("Artists")
      expect(result["items"]).to eq([])
    end

    describe "with artists" do
      before do
        @artist1 = create(:artist, name: "Mocart")
        @artist2 = create(:artist)
        get :index
        @result = JSON.parse(response.body)
      end


      it "response status" do
        expect(@result["status"]).to eq("ok")
      end

      it "response message" do
        expect(@result["message"]).to eq("Artists")
      end

      it "response items" do
        expect(@result["items"].length).to eq(2)
        expect(@result["items"][0]).to include("name" => @artist1[:name])
        expect(@result["items"][1]).to include("name" => @artist2[:name])
      end
    end
  end
end
