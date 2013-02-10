FactoryGirl.define do

  sequence :name do |n|
    "Name#{n}"
  end

  sequence :string do |n|
    "StringString#{n}"
  end

  sequence :email do |n|
    "email-#{n}@example.com"
  end

end
