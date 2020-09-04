class CreateShippingInformations < ActiveRecord::Migration[6.0]
  def change
    create_table :shipping_informations do |t|
      t.references :order, null: false, foreign_key: true
      t.integer :prefecture_id, null: false
      t.string :city, null: false
      t.string :block, null: false
      t.string :building
      t.string :postal_code, null: false
      t.string :phone_number, null: false
    end
  end
end
