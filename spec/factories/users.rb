FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    family_name           { '鈴木' }
    first_name            { '修' }
    family_name_reading   { 'スズキ' }
    first_name_reading    { 'オサム' }
    birthday              { '1930-01-30' }
  end
end
