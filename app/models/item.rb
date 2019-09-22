class Item < ApplicationRecord
  has_many :images , dependent: :destroy
  has_many :comments , dependent: :destroy
  belongs_to :category
  belongs_to :brand
  belongs_to :user
end
