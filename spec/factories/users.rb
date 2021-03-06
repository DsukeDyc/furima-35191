FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials }
    email                 { Faker::Internet.free_email }
    password              { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    last_name             { '名まエ' }
    first_name            { '名まエ' }
    last_name_reading     { 'カタカナ' }
    first_name_reading    { 'カタカナ' }
    birth                 { '2020-1-1' }
  end
end
