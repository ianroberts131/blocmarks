FactoryGirl.define do
  email = Faker::Internet.email
  factory :user do
    email email
    password "password"
    password_confirmation "password"
  end
end
