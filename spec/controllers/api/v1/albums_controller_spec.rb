require 'rails_helper'

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
      expect(result.length).to eq(0)
    end

    it "wrong artist_id" do
      get :index, artist_id: 1
      expect(response.body).to eq("The search has not given any results")
    end


    describe "with albums" do
      before do
        @album1 = create(:album, name: "Album_1", artist_id: artist.id)
        @album2 = create(:album, name: "Album_2", artist_id: artist.id)
        get :index, artist_id: artist.id
        @result = JSON.parse(response.body)
      end

      it "loads all of the albums" do
        expect(@result.length).to eq(2)
        expect(@result[0]).to include("name" => @album1[:name])
        expect(@result[1]).to include("name" => @album2[:name])
      end
    end
  end
end
