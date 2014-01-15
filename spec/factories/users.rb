# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    sequence(:uid) { |n| "1#{n}" }
    provider "github"
    sequence(:name) { |n| "us#{n}er" }
  end
end

