FactoryGirl.define do
  factory :album do
    name "Album"
    artwork_url_100 "String_with_url"
    association :artist
  end
end