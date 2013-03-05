FactoryGirl.define do
  factory :work do
    description {generate :string}
    image  {generate :string}
    name  {generate :string}
    nomination  {generate :string}
    user
  end
end