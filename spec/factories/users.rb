FactoryGirl.define do
  factory :user do
    transient do #upcase the email
      upcased true
    end  

    name "Maurya"
    # for email uniqueness
    sequence(:email, 10) { |n| "user#{n}@gmail.com" }

#logic for "upcase the email"
    after(:build) do |user, eval|
      user.email.upcase! if eval.upcased 
    end  
  end
end  
