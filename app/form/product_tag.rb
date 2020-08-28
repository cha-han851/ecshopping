class ProductTag

  include ActiveModel::Model
  attr_accessor :tag_name, :user_id,:name,:description,:brand,:price,:ship_day,:images
  with_options presence: true do
    validates :tag_name
    validates :user_id
    validates :name
    validates :description
    validates :brand
    validates :price,numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
    validates :ship_day
    validates :images
  end
  

  def save
    product = Product.create(user_id: user_id,name: name,description: description,brand: brand,price: price,ship_day: ship_day,images: images)
    tag = Tag.create(tag_name: tag_name)

    TagMap.create(product_id: product.id, tag_id: tag.id)
  end
end