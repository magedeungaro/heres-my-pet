FactoryBot.define do
  factory :user do
    first_name { 'John' }
    last_name { 'Doe' }
    password { '123456' }
    birthdate { 25.years.ago }
    email { 'test@ruby.com' }
  end

  factory :pet do
    name { 'Cookie' }
    birthdate { 2.years.ago }
    pet_type { 'cat' }
    gender { 'female' }
    association :user
  end
end
