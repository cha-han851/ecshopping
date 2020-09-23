# README
# admin_users_table
|Column|Type|Options|
|------|----|-------|
|email|string|null: false|
|encrypted_password|string|null: false|


## article_table
|Column|Type|Options|
|------|----|-------|
|title|string|null: false|
|content|text|null: false|


 

## cart_product_table
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false|
|password|string|null: false|
|first_name|string|null: false|
|family_name|string|null: false|
|first_name_kana|string|null: false|
|family_name_kane|string|null: false|
|birthday|date|null: false|


### Association
- has_many :items
- has_many :purchased_items

## carts_table
|Column|Type|Options|
|------|----|-------|


### Association
- has_many :cart_products, dependent: :destroy

## cart_products_table
|Column|Type|Options|
|------|----|-------|
|quantity|integer|default: 0|
|product|references|null: false, foreign_key: true|
|cart|references|null: false, foreign_key: true|


### Association
- belongs_to :product
- belongs_to :cart

## order_table
|Column|Type|Options|
|------|----|-------|
|product_id|integer|null: false, foreign_key: true|
|user_id|integer|null: false, foreign_key: true|



### Association
- belongs_to :user
- belongs_to :product
- has_many :shipping_informations


## product_table
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|description|text|null: false|
|brand|string|null:false|
|ship_day|integer|null: false|
|price|integer|null: false|

### Association
- has_many :orders
- has_many_attached :images
- has_many :tag_maps, dependent: :destroy
- has_many :tags, through: :tag_maps


## shipping_information_table
|Column|Type|Options|
|------|----|-------|
|order|references|null: false, foreign_key: true|
|prefecture_id|integer|null: false|
|city|string|null: false|
|block|string|null: false|
|building|string|---|
|postal_code|string|null: false|
|phone_number|string|null: false|


### Association
-belongs_to :purchased_item

## tag_map_table
|Column|Type|Options|
|------|----|-------|
|item_id|integer|null: false, foreign_key: true|
|user_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item
- has_one :delivery_address

## tag_table
|Column|Type|Options|
|------|----|-------|
|tag_name|text|

### Association
- has_many :tag_maps, dependent: :destroy, foreign_key: 'tag_id'
- has_many :products, through: :tag_maps


## users_table
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false|
|password|string|null: false|
|first_name|string|null: false|
|family_name|string|null: false|
|first_name_kana|string|null: false|
|family_name_kane|string|null: false|
|birthday|date|null: false|



### Association
- has_many :orders



