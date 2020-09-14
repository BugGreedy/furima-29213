FactoryBot.define do
  factory :item do
     association :user
    text                    {Faker::Lorem.sentence}
    name                    {Faker::Games::Pokemon.name }
    condition_id            {Faker::Number.between(from: 1, to: 6)}
    genre_id                {Faker::Number.between(from: 1, to: 10)}
    shipping_charge_id      {Faker::Number.between(from: 1, to: 2)}
    shipping_place_id       {Faker::Number.between(from: 1, to: 10)}
    shipping_date_id        {Faker::Number.between(from: 1, to: 47)}
    price                   {Faker::Number.between(from: 300, to: 9999999)}
    # user_id                 {Faker::Number.between(from: 1, to: 2)}
  end
  
  # after(:build) do |item|
  # item.image.attach(io: File.open('spec/testimages/image_test01.png'),filename: 'image_test01.png', content_type: 'image/png')
  # end
end