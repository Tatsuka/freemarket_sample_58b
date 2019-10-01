class Transaction < ApplicationRecord
  belongs_to :item
  belongs_to :transaction_partner

  # ActiveHash実装時記述
  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to_active_hash :status
end