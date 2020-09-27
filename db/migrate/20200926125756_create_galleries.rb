class CreateGalleries < ActiveRecord::Migration[6.0]
  def change
    create_table :galleries do |t|
      t.references :user, foreign_key: true
      t.string :caption
      t.timestamps
    end
  end
end
