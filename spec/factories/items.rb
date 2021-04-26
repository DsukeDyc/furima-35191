FactoryBot.define do
  factory :item do
    name                  {Faker::Name.initials(number: 2)}
    description           {Faker::Lorem.sentence(word_count: 1000)}
    type_id               { 2 }
    condition_id          { 2 }
    shipping_cost_id      { 2 }
    prefecture_id         { 2 }
    shipdate_id           { 2 }
    price                 { 9999999 }
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end