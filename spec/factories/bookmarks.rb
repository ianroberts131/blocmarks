FactoryGirl.define do
  factory :bookmark do
    url Faker::Internet.domain_name
    topic nil
  end
end
