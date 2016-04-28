require "rails_helper"

RSpec.describe Artist, type: :model do

  before do
    @album = create(:album)
  end

  subject { @album }

  it { should respond_to(:name) }
  it { should respond_to(:artwork_url_100) }
  it { should respond_to(:artist_id) }

end