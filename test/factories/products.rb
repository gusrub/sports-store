FactoryGirl.define do
  factory :product do
    name "MyString"
    description "MyText"
    code "SomeCode"
    enabled false
    association :category
  end
end
