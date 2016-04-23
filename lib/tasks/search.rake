namespace :search do
  desc "Search artist by name from Itunes API"
  task :artist, [:artist_name] => :environment do |task, args|
    Rake::Task['db:reset'].invoke
    artist_searched = args.artist_name
    puts "Loading artist: #{artist_searched}"

    response = JSON.parse ( HTTParty.get("https://itunes.apple.com/search?term=#{artist_searched}&entity=musicArtist") )

    if response.present? && response.has_key?("results") && response["results"].any?
      response["results"].each do |artist_found|
        artist = Artist.create(
            name: artist_found["artistName"],
            itunes_id: artist_found["artistId"]
        )
        albums = JSON.parse ( HTTParty.get("https://itunes.apple.com/lookup?id=#{artist.itunes_id}&entity=album") )

        if albums.present? && albums.has_key?("results") && albums["results"].any?
          albums["results"].each do |album_found|
            if album_found["collectionType"] == "Album"
              Album.create(
                  name: album_found["collectionName"],
                  artwork_url_100: album_found["artworkUrl100"],
                  artist_id: artist.id)
            end
          end
        end

      end
    end
  end
end
