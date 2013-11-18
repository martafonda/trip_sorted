# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :ticket do
    origin "MyString"
    destination "MyString"
    transportation_type "MyString"
    transportation_id "MyString"
    seat "MyString"
    extra_information "MyString"
  end
end
