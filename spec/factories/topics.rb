FactoryGirl.define do
  factory :topic do
    title Faker::Hipster.word
    user
  end
end
