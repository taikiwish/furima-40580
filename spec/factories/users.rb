FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.email }
    password              { "b9" + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    familyname            { '漢字'  }
    firstname             { '漢字'  }
    familyname_kana       { 'カタカナ' }
    firstname_kana        { 'カタカナ' }
    birthday              { Faker::Date.between(from: '1930-01-01', to: '2023-12-31') }
  end
end