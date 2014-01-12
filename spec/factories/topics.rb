# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :topic do
    user
    sequence(:session_id) {|n| n }
    title "MyString"
    description "MyText"
  end
end
