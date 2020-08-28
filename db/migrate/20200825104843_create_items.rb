class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :product,              null: false
      t.string :discription,          null: false
      t.integer :price,               null: false
      t.integer :category,            null: false
      t.integer :product_condition,   null: false
      t.integer :shipping_fee_burde,  null: false
      t.integer :shipping_region,     null: false
      t.integer :days_until_shipping, null: false
      t.references :user,             null: false, foreign_key: true
      t.timestamps
    end
  end
end
