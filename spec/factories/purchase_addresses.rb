FactoryBot.define do
  factory :purchase_address do
    zipcode         { Faker::Number.between(from: 100, to: 999).to_s + "-" + Faker::Number.between(from: 1000, to: 9999).to_s }
    area_id         { Faker::Number.between(from: 2, to: 48) }
    city            { Faker::Address.city }
    number          { Faker::Address.street_address }
    building        { Faker::Address.building_number }
    phone           { "0" + Faker::Number.between(from: 100000000, to: 9999999999).to_s }
    user_id         { Faker::Number.between(from: 1, to: 100) }
    item_id         { Faker::Number.between(from: 1, to: 100) }
    token           {"tok_abcdefghijk00000000000000000"}

    association :user
    association :item
  end
end