FactoryGirl.define do
  factory :album do
    #title "The Game" #replaced with Faker
    title Faker::Book.title

    trait :popular do
      popular true
    end

    factory :popular_album, traits: [:popular] 
  end
end 