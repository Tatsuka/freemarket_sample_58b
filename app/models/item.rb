class Item < ApplicationRecord
  has_many :images , dependent: :destroy
  has_many :comments , dependent: :destroy
  belongs_to :category
  belongs_to :brand

  # has_one :transaction
  # extend ActiveHash::Associations::ActiveRecordExtensions
    # belongs_to_active_hash :condition
    # belongs_to_active_hash :trade_status
end
