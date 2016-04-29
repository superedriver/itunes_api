require "rails_helper"

RSpec.describe Api::V1::AlbumsController, type: :controller do
  let(:artist) { create(:artist) }

  describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
      get :index, artist_id: artist.id
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "without albums" do
      get :index, artist_id: artist.id
      result = JSON.parse(response.body)
      expect(result["status"]).to eq("ok")
      expect(result["items"]).to eq([])
    end

    describe "wrong artist_id" do
      before do
        get :index, artist_id: 1
        @result = JSON.parse(response.body)
      end

      it "HTTP 404 status code" do
        expect(response).to have_http_status(404)
      end

      it "response body" do
        expect(@result["status"]).to eq("error")
        expect(@result["message"]).to eq("Not Found")
        expect(@result["items"]).to eq([])
      end
    end


    describe "with albums" do
      before do
        @album1 = create(:album, name: "Album_1", artist_id: artist.id)
        @album2 = create(:album, name: "Album_2", artist_id: artist.id)
        get :index, artist_id: artist.id
        @result = JSON.parse(response.body)
      end

      it "response status" do
        expect(@result["status"]).to eq("ok")
      end

      it "response items" do
        expect(@result["items"].length).to eq(2)
        expect(@result["items"][0]).to include("name" => @album1[:name])
        expect(@result["items"][1]).to include("name" => @album2[:name])
      end
    end
  end
end
