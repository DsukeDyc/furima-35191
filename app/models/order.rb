class Order < ApplicationRecord
  has_one :address_book
  belongs_to :item
  #has_one :order_address
end
