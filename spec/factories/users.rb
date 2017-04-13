FactoryGirl.define do
  factory :user do
    name "Maurya"
    # for email uniqueness
    sequence(:email, 10) { |n| "user#{n}@gmail.com" }
  end
end  
