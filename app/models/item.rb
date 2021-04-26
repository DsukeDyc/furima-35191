class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :type
  belongs_to :condition
  belongs_to :shipping_cost
  belongs_to :prefecture
  belongs_to :shipdate

  with_options presence: true do
    validates :name
    validates :description
    validates :type_id
    validates :condition_id
    validates :shipping_cost_id
    validates :prefecture_id 
    validates :shipdate_id
    validates :price
    validates :image
  end

  with_options numericality: {other_than: 1 } do
    validates :type_id
    validates :condition_id
    validates :shipping_cost_id
    validates :prefecture_id 
    validates :shipdate_id
  end

  validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is invalid"}
end
