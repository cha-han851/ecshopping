class Product < ApplicationRecord
  belongs_to :user 
  has_many :orders
  has_many_attached :images
  has_many :tag_maps, dependent: :destroy
  has_many :tags, through: :tag_maps
  accepts_nested_attributes_for :tags, allow_destroy: true
  
  
  enum brand:{
    Canon: "Canon", 
    Nikon: "Nikon", 
    SONY: "SONY", 
    FUJIFILM: "FUJIFILM", 
    Panasonic: "Panasonic", 
    OLYMPUS: "OLYMPUS",
    PENTAX:  "PENTAX"
  }
  enum ship_day: {
  today: 0,
  tomorrow: 1,
  dayaftertommow: 2
  }
 
  PHONE_CODE_REGEX = /\A\d{11}\z/
  with_options presence: true do
  
  validates :user_id
  validates :product_id
  validates :name, null: false
  validates :price, null: false
  validates :description, null: false
  validates :brand, null: false
  validates :ship_day, null: false
  end
  
end
