FactoryGirl.define do
  factory :charge do
    user nil
    stripe_charge_id "MyString"
  end
end
