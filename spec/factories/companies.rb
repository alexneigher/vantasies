FactoryGirl.define do
  factory :company do
    user nil
    name "MyString"
    location "MyText"
    sells_vans false
    website_url "MyString"
    instagram_url "MyString"
    phone_number "MyString"
    email_address "MyString"
    description "MyText"
    services_offered "MyText"
  end
end
