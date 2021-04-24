class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :type_id, :condition_id, :shipping_cost_id, :prefecture_id, :shipdate_id

  with_options presence: true do
    validates :name
    validates :description
    validates :type_id
    validates :condition_id
    validates :shipping_cost_id
    validates :prefecture_id 
    validates :shipdate_id
    validates :price
  end

  with_options numericality: {other_than: 1 } do
    validates :type_id
    validates :condition_id
    validates :shipping_cost_id
    validates :prefecture_id 
    validates :shipdate_id
  end
end
