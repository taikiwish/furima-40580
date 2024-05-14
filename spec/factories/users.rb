FactoryBot.define do
  factory :user do
    nickname { Faker::Name.initials(number: 2) }
    email { Faker::Internet.email }
    password { Faker::Internet.password(min_length: 6) }
    password_confirmation { |u| u.password }
    familyname { Faker::Name.last_name }
    firstname { Faker::Name.first_name }
    familyname_kana { Faker::Japanese::Name.last_name }
    firstname_kana { Faker::Japanese::Name.first_name }
    birthday { Faker::Date.birthday(min_age: 18, max_age: 65) }
  end
end