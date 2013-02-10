FactoryGirl.define do
  factory :user do
    email
    password { generate :string }
    first_name { generate :name }
    last_name { generate :name }
    patronymic { generate :name }
  end
end
