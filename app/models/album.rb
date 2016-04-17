class Album < ActiveRecord::Base
  belongs_to :artist
  validates :artist_id, presence: true
end
