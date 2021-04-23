FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    last_name             {"kkk"}
    first_name            {"kkk"}
    last_name_reading     {"カタカナ"}
    first_name_reading    {"カタカナ"}
    birth                 {"2020-1-1"}
  end
end