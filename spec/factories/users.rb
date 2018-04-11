FactoryGirl.define do
  pw = RandomData.random_sentence
# we declare the name of the facotry user
  factory :user do
    name RandomData.random_name
#build unique email
    sequence(:email){|n| "user#{n}@factory.com" }
    password pw
    password_confirmation pw
    role :member
  end
end
