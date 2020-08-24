class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.integer :user_id, null: false, foreign_key: true
      t.string :name, null: false
      t.integer :price, null: false
      t.text :description, null: false
      t.string :brand, null: false
      t.string :ship_day, null: false
      t.timestamps
    end
  end
end
