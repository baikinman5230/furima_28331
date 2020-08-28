class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category

  with_options presence: true do
    validates :image
    validates :product
    validates :discription
    validates :price
    validates :category
  end
  validates :category_id, numericality: { other_than: 1 }

  belongs_to :user
  

end
