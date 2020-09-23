class Product < ApplicationRecord
  has_many :orders
  has_many_attached :images
  has_many :tag_maps, dependent: :destroy
  has_many :tags, through: :tag_maps
  accepts_nested_attributes_for :tags, allow_destroy: true

  enum brand: {
    Canon: 'Canon',
    Nikon: 'Nikon',
    SONY: 'SONY',
    FUJIFILM: 'FUJIFILM',
    Panasonic: 'Panasonic',
    OLYMPUS: 'OLYMPUS',
    PENTAX: 'PENTAX'
  }
  enum ship_day: {
    "1~2日以内": 0,
    "3~4日以内": 1,
    "5日以上": 2
  }

  PHONE_CODE_REGEX = /\A\d{11}\z/.freeze
  with_options presence: true do
    validates :name, null: false
    validates :price, null: false, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
    validates :description, null: false
    validates :brand, null: false
    validates :ship_day, null: false
    validates :images, null: false
  end
end
