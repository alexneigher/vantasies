FactoryGirl.define do
  factory :message do
    van nil
    reply_to "MyString"
    subject "MyString"
    body "MyText"
  end
end
