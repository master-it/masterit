FactoryGirl.define do
  factory :user do
    email
    password
    role "user"
  end
end