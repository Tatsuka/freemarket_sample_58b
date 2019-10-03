class Transaction < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :item
  belongs_to :transaction_partner

  belongs_to_active_hash :status
end