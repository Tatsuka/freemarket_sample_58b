# DB設計

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|e_mail|string|null:false|
|password|string|null:false|
|nickname|string|null:false|
|first_name_kana|string|null:false|
|last_name_kana|string|null:false|
|first_name_kanji|string|null:false|
|last_name_kanji|string|null:false|
|birth_day|date|null: false|
|introduction|text|null:false|
|phone_number|string|null:false, unique:true|
### Association
- has_many :comments
- has_many :items
- has_many :transaction_partners
- has_one :sns_credentials dependent: :destroy
- has_one :credit_card dependent: :destroy
- has_one :address dependent: :destroy

## user_addressesテーブル
|Column|Type|Options|
|------|----|-------|
|user|bigint|null:false, foreign_key: true|
|prefecture|bigint|null:false, foreign_key: true|
|city|string|null:false|
|block_number|integer||
|building_name|string||
|phone_number|string||
|first_name_kana|string|null:false|
|last_name_kana|string|null:false|
|first_name_kanji|string|null:false|
|last_name_kanji|string|null:false|
|postal_code|string|null:false|
### Association
- belongs_to :user
- belongs_to_active_hash :prefecture


## shipping_addressテーブル
|Column|Type|Options|
|------|----|-------|
|first_name_kana|string|null:false|
|last_name_kana|string|null:false|
|first_name_kanji|string|null:false|
|last_name_kanji|string|null:false|
|postal_code|integer|null:false|
|prefecture|bigint|null:false, foreign_key: true|
|city|string|null:false|
|block_number|integer||
|building_name|string||
|phone_number|integer|null:false, unique:true|
|user|bigint|null:false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to_active_hash :prefecture


## credit_cardsテーブル
|Column|Type|Options|
|------|----|-------|
|user|bigint|null:false,foreign_key:true|
|card_number|string|null:false|
|security_code|integer|null:false|
|expiry_year|integer|null:false|
|expiry_month|integer|null:false|
### Association
- belongs_to :user


## sns_credentialsテーブル
|Column|Type|Options|
|------|----|-------|
|user|bigint|null:false,foreign_key:true|
|uid|string|null:false|
|provider|string|null:false|
### Association
- belongs_to :user

## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|detail|text|null: false|
|shipping_cost|integer|null: false|
|shipping_fee_charge_to|integer|null: false|
|shipping_days|integer|null: false|
|condition|bigint|null:false,foreign_key: true|
|category|bigint|null:false,foreign_key:true|
|trade_status|bigint|null:false,foreign_key:true, default: 1|
|brand|bigint|foreign_key: true|
|user|bigint|null:false, foreign_key: true|
|prefecture|bigint|null:false, foreign_key: true|
### Association
- has_many :images dependent: :destroy
- has_many :comments dependent: :destroy
- belongs_to :category
- belongs_to :user
- has_one :trade
- belongs_to_active_hash :trade_status
- belongs_to_active_hash :prefecture

## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|item|bigint|null:false,foreign_key:true|
|image|string|null: false|
### Association
- belongs_to :item


## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|user|bigint|null:false, foreign_key: true|
|item|bigint|null:false, foreign_key: true|
|content|text|null: false|
|created_at|timestamps|null: false|
### Association
- belongs_to :item
- belongs_to :user


## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string||
### Association
- has_many :items
- has_ancestry


<!-- ## brandsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
### Association
- has_many :items
- has_many :categories, through: :categories_brands -->


## categories_brands
|Column|Type|Options|
|------|----|-------|
|category|bigint|null:false, foreign_key: true|
|brand|bigint|null:false, foreign_key: true|
### Association
- belongs_to :category


## transaction_partnersテーブル
|Column|Type|Options|
|------|----|-------|
|buyer|bigint|null: false, foreign_key: true|
|seller|bigint|null: false, foreign_key: true|
### Association
- belongs_to :buyer, class_name: 'User', foreign_key: 'buyer_id'
- belongs_to :seller, class_name: 'User', foreign_key: 'seller_id'
- has_many :trades


## tradesテーブル
|Column|Type|Options|
|------|----|-------|
|status|bigint|null:false, foreign_key: true|
|item|bigint|null:false, foreign_key: true|
|transaction_partner|bigint|null: false, foreign_key: true|
### Association
- belongs_to :item
- belongs_to :transaction_partner
- belongs_to_active_hash :status