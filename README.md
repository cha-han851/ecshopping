# README
## アプリ名
Ecshoppping

## 概要
### 機能の説明

・管理者画面

・商品の出品、購入、編集、一覧、削除機能

・カート機能

・記事一覧、記事詳細機能

・画像の複数投稿及びスライドショー機能

・ギャラリー機能

  マイページから閲覧可能

・ユーザー機能

  ロウグイン後画面右上からユーザー名を栗句することで表示されます。

・複数の条件による商品の検索機能

## 本番環境
サイトURL:https://ecshopping-28706.herokuapp.com/

Basic認証
ユーザー名: admin
 /password:2222

Admin用
メールアドレスadmin@sample.com
 /password: password123

管理者画面のURL
https://ecshopping-28706.herokuapp.com/admin

Test user用
メールアドレス:sample@aaa.co.jp
 /password:aa1111
 
画面上部よりログイン可能です。


## 制作背景
私はカメラ好きなのですが、どのカメラのECサイトも文字ばかりであまり引きつけれられる物がなかったので自分自身で作ろうと思ったがきっかけです。
また、一眼レフのユーザーの中にはデザイン関係の方々もたくさんいらっしゃると推測しますが、文字によるアプローチよりデザインによる感覚的的なアプローチの方がユーザーの関心を高めより多くの人に一眼レフの魅力を知ってもらうためにこのECサイトを作りました。
## 工夫したポイント
ユーザー自身が作成することができるギャラリー機能の作成によりユーザー同士が交流が持てる場所の構築とギャラリーに投稿された写真が出品している画像のサンプル画像になる。
## 使用技術(開発環境)
Ruby 2.6.5

Rails 6.0.0

MySQL5.6


					
## 課題や今後実装したい機能	
ユーザーごとの個人ギャラリー機能

ユーザー間でのコミュニケーションが取れるチャットルーム機能

## DB設計									
## admin_users_table
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



