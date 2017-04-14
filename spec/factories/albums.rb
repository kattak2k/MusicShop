FactoryGirl.define do
  factory :album do
    #title "The Game" #replaced with Faker
    title Faker::Book.title 
  end
end 