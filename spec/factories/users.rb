FactoryBot.define do
  factory :user do
    name 'Userton'
    sequence :email do |n|
      "user_#{n}@example.com"
    end
    password '1234567890'
  end
end
