require "rails_helper"

RSpec.describe Artist, type: :model do

  before do
    @artist = create(:artist)
  end

  subject { @artist }

  it { should respond_to(:name) }
  it { should respond_to(:albums) }

end