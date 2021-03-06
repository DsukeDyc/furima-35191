FactoryBot.define do
  factory :address_book do
    postal_code { '123-4567' }
    prefecture_id { 1 }
    city { '東京都' }
    house_number { '1-1' }
    building_name { '東京ハイツ' }
    tel { '000-1234-5678' }
  end
end
