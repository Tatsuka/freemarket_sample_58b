class TransactionPartner < ApplicationRecord
  belongs_to :buyer, class_name: 'User', forign_key: 'buyer_id'
  belongs_to :seller, class_name: 'User', forign_key: 'seller_id'
  has_many :trade
end
