# README

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null:false|
|e_mail|string|null:false|
|password|string|null:false|
|phone_number|integer|null:false|
|first_name_kana|string|null:false|
|last_name_kana|string|null:false|
|first_name_kanji|string|null:false|
|last_name_kanji|string|null:false|
|birth_year|integer|null: false|
|birth_month|integer|null: false|
|birth_day|integer|null: false|

### Association
- has_many :items
- has_many :comments
- has_one :address dependent: :destroy
- has_one :credit_card dependent: :destroy
- has_one :sns_credentials dependent: :destroy


## addressesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null:false, foreign_key: true|
|postal_code|integer|null:false|
|prefecture|integer|null:false|
|city|string|null:false|
|block_number|integer||
|building_name|string||

### Association
- belongs_to :user


## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null:false, foreign_key: true|
|condition|integer|null:false|
|price|integer|null: false|
|name|string|null: false|
|detail|text|null: false|
|category|integer|null: false|
|shipping_cost|integer|null: false|
|shipping_fee_charge_to|integer|null: false|
|shipping_from|integer|null: false|
|shipping-days|integer|null: false|
|seller_id|references|null: false|
|buyer_id|references|null: false|

### Association
- has_many :images dependent: :destory
- has_many :comments dependent: :destory
- belongs_to :user
- belongs_to :category
- belongs_to :brand
- belongs_to :seller, class_name: "User"
- belongs_to :buyer, class_name: "User"


## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|item_id|references|null:false,foreign_key:true|
|image|string|null: false|

### Association
- belongs_to :item


## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null:false, foreign_key: true|
|item_id|references|null:false, foreign_key: true|
|content|text|null: false|
|created_at|timestamps|null: false|

### Association
- belongs_to :item
- belongs_to :user


## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestory|string||

### Association
- has_many :items
- has_ancestory


## brandsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many :items


## credit_cardsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null:false,foreign_key:true|
|card_number|integer|null:false|
|security_code|integer|null:false|
|expiry_year|integer|null:false|
|expiry_month|integer|null:false|

### Association
- belongs_to :user


## sns_credentialsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null:false,foreign_key:true|
|uid|integer|null:false,unique: true|
|provider|integer|null:false|

### Association
- belongs_to :user
