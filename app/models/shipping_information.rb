class ShippingInformation < ApplicationRecord
  

  POSTAL_CODE_REGEX = /\A\d{3}[-]\d{4}\z/ 
  PHONE_CODE_REGEX = /\A\d{11}\z/
  with_options presence: true do
    validates :postal_code, format: { with: POSTAL_CODE_REGEX }
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :city
    validates :block
    # validates :building
    validates :phone_number, format: { with:PHONE_CODE_REGEX }
    validates :user_id
    validates :item_id
  end
    
end
