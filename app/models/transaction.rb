class Transaction < ApplicationRecord
  belongs_to :item
  belongs_to :transaction_partner

  # extend ActiveHash::Associations::ActiveRecordExtensions
  #   belongs_to_active_hash :status
end
