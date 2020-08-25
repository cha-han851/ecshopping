class Product < ApplicationRecord
  belongs_to :user 
  has_many :orders
  has_many_attached :images
 
  enum brand:{
    Canon: 0, 
    Nikon: 1, 
    SONY: 2, 
    FUJIFILM: 3, 
    Panasonic: 4, 
    OLYMPUS: 5,
    PENTAX:  6
  }
  enum ship_day: {
  today: 0,
  tomorrow: 1,
  dayaftertommow: 2
  }


  
  
  with_options presence: true do
  validates :name
  validates :description
  validates :brand
  validates :ship_day
  validates :price,numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }  
end
 
end
