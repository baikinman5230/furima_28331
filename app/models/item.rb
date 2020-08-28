class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :product_condition
  belongs_to_active_hash :shipping_fee_burde
  belongs_to_active_hash :shipping_region
  belongs_to_active_hash :days_until_shipping

  with_options presence: true do
    validates :image
    validates :product
    validates :discription
    validates :price
    validates :category
    validates :product_condition
    validates :shipping_fee_burde
    validates :shipping_region
    validates :days_until_shipping
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :product_condition_id
    validates :shipping_fee_burde_id
    validates :shipping_region_id
    validates :days_until_shipping_id
  end

  belongs_to :user
  

end
