class Product < ApplicationRecord

  belongs_to :user 
  has_many :orders
  has_one_attached :image

  enum brand:{
    Canon: "Canon", #小説
    Nikon: "Nikon", #エッセイ
    SONY: "SONY", #実用
    FUJIFILM: "FUJIFILM", #漫画
    Panasonic: "Panasonic", #その他
    OLYMPUS: "OLYMPUS:",
    PENTAX:  "PENTAX"
  }
  enum ship_day: {
  today: "1~2日で発送",
  tomorrow: "3~4日で発送",
  dayaftertommow: "4~7日で発送"

  }

  
  with_options presence: true do
  validates :name
  validates :description
  validates :brand
  validates :ship_day
  validates :price,numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  end
 
end
