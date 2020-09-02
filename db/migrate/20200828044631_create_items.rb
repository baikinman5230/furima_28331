class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string     :product,                null: false
      t.text       :discription,            null: false
      t.integer    :price,                  null: false
      t.integer    :category_id,            null: false
      t.integer    :product_condition_id,   null: false
      t.integer    :shipping_fee_burde_id,  null: false
      t.integer    :shipping_region_id,     null: false
      t.integer    :days_until_shipping_id, null: false
      t.integer    :buyer_id
      t.references :user,                   null: false, foreign_key: true
      t.timestamps
    end
  end
end
