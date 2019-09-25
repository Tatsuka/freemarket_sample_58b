class Item < ApplicationRecord
  has_many :images, inverse_of: :item, dependent: :destroy
  has_many :comments , dependent: :destroy
  belongs_to :category
  belongs_to :brand
  belongs_to :user

  accepts_nested_attributes_for :images
  # has_one :transaction
  # extend ActiveHash::Associations::ActiveRecordExtensions
    # belongs_to_active_hash :condition
    # belongs_to_active_hash :trade_status
  scope :extract_by_category, -> (category_id) { where(category_id: category_id).limit(10).order("created_at DESC") }

  enum condition_id: {"---": 0, 新品、未使用: 1, 未使用に近い: 2, 目立った傷や汚れなし: 3, やや傷や汚れあり: 4, 傷や汚れあり: 5, 全体的に状態が悪い: 6}, _prefix: true
  enum shipping_fee_charge_to: {"---": 0, "送料込み(出品者負担)": 1, "着払い(購入者負担)": 2}, _prefix: true
  enum shipping_days: {"---": 0, "1~2日で発送": 1, "2~3日で発送": 2, "4~7日で発送": 3}, _prefix: true
  enum brand_id: {"---": 0, "任天堂": 1, "capcom": 2, "konami": 3}, _prefix: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

end