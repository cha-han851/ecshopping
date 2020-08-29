class Product < ApplicationRecord
  belongs_to :user 
  has_many :orders
  has_many_attached :images
  has_many :tag_maps, dependent: :destroy
  has_many :tags, through: :tag_maps
  accepts_nested_attributes_for :tags, allow_destroy: true
  
  
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
  
end
