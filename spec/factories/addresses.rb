FactoryBot.define do
  factory :address do
    association :order
    postal_code   { '123-4567' }
    prefecture_id { Faker::Number.between(from: 1, to: 47) }
    city          { Faker::Games::Pokemon.location }
    house_number  { Faker::Games::Witcher.location }
    building_name { Faker::Games::SuperSmashBros.stage }
    phone_number  { Faker::Number.leading_zero_number(digits: 11) }
  end
end
