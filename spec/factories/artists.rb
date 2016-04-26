FactoryGirl.define do
  factory :artist do
    name "Bach"
    sequence(:itunes_id) { |i| i }
  end
end