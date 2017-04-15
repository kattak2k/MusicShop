FactoryGirl.define do
  factory :cart_item do
    #title "The Game" #replaced with Faker
    user 
    album
    quantity 1
  end
end 