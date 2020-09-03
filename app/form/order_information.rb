class OrderInformation
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :block, :building, :phone, :user_id, :item_id, :token

  POSTAL_CODE_REGEX = /\A\d{3}[-]\d{4}\z/ 
  PHONE_CODE_REGEX = /\A\d{11}\z/
  with_options presence: true do
    validates :postal_code, format: { with: POSTAL_CODE_REGEX }
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :city
    validates :town
    # validates :building_name
    validates :phone, format: { with:PHONE_CODE_REGEX }
    validates :user_id
    validates :item_id
  end

  def save
    Order.create(user_id: user_id, item_id: item_id)
    ShippingInoformation.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, town: town, building_name: building_name, phone: phone, item_id: item_id)
  end
end