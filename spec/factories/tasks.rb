FactoryBot.define do 
  factory :task do
    list
    sequence(:tittle) { |n| "test#{n}" }
    sequence(:description) { |n| "test#{n}" }
  end
end