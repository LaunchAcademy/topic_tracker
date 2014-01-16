# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :topic do
    user

    sequence(:title) { |n| "Example #{n} Title" }
    sequence(:description) { |n| "Example #{n} Description" }
  end
end
