FactoryBot.define do
  factory :item do
    name                  {Faker::Name(max_length: 40)}
    description           {Faker::Lorem.sentence(max_length: 1000)}
    type_id               { 2 }
    condition_id          { 2 }
    shipping_cost_id      { 2 }
    prefecture_id         { 2 }
    shipdate_id           { 2 }
    price                 {"0000000"}
    association :user
  end
end