class TransactionAddress
  
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture, :city, :house_number, :building_name, :phone_number, :item_id, :token, :user_id

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
    validates :city
    validates :house_number
    validates :phone_number, format: {with: /\A\d{11}\z/}
  end

  with_options numericality: {other_than: 1} do
    validates :prefecture
  end

  def save
    item_purchase = ItemPurchase.create(item_id: item_id, user_id: user_id)
    Address.create(item_purchase_id: item_purchase.id, postal_code: postal_code, prefecture: prefecture, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number)
  end
end