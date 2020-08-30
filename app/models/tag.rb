class Tag < ApplicationRecord
  has_many :tag_maps, dependent: :destroy, foreign_key: 'tag_id'
  has_many :products, through: :tag_maps


  validate :tag_name#, uniqueness: true
end
