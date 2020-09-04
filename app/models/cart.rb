class Cart < ApplicationRecord
  has_many :cart_products

  enum quntity: {
    1: 1,
    2: 2,
    3: 3



  }
end
