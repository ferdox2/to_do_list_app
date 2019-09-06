FactoryBot.define do 
  factory :list do
    user
    sequence(:tittle) { |n| "test#{n}" }
  end
end