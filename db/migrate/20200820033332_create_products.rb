class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.integer :user_id, null: false, foreign_key: true
      t.string :image, null: false
      t.string :name, null: false
      t.integer :price, null: false
      t.text :description, null: false
      t.integer :ship_day_id, null: false
      t.timestamps
    end
  end
end
