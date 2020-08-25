class Image < ApplicationRecord
  belongs_to :product
  validate :image

end
