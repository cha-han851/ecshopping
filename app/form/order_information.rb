class OrderInformation
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :price, :block, :building, :phone_number, :user_id, :product_id, :order_id, :token, :authenticity_token
  PHONE_CODE_REGEX = /\A\d{11}\z/.freeze
  POSTAL_CODE_REGEX = /\A\d{3}[-]\d{4}\z/.freeze

  with_options presence: true do
    validates :user_id
    validates :product_id
    validates :postal_code, format: { with: POSTAL_CODE_REGEX }
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :city
    validates :block
    #  validates :building
    validates :phone_number, format: { with: PHONE_CODE_REGEX }
  end

  def save
    order = Order.create(user_id: user_id, product_id: product_id)

    ShippingInformation.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, block: block, building: building, phone_number: phone_number, order_id: order.id)
  end
end
