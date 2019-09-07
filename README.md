# mercari DB設計

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|username|string|null: false|
|kana|string|null: false|
|email|string|null: false|
|password|string|null: false|
|phone|string|null: false|
|birthday|string|null: false|
|address|text|null: false|
|image|string||
### Association
- has_many :items

## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|comment|text|null: false|
|condition|text|null: false|
|price|integer|null: false|
### Association
- belongs_to :user
