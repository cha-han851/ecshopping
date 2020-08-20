class Product < ApplicationRecord
with_options presence: true do
  validates :image
  validates :name
  validates :description
  validates :ship_day_id, numericality: {other_than: 1}
  validates :price,numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
end

end
