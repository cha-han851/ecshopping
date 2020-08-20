class CreateShippingInformations < ActiveRecord::Migration[6.0]
  def change
    create_table :shipping_informations do |t|
      t.integer :order_id, null: false
      t.integer :prefecture_id, null: false
      t.string :city, null: false
      t.string :block, null: false
      t.string :building
      t.string :postal_code, null: false
      t.integer :phone_number, null: false
      t.timestamps
    end
  end
end
