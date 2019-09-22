class Item < ApplicationRecord
  has_many :images , dependent: :destroy
  has_many :comments , dependent: :destroy
  belongs_to :category
  belongs_to :brand
  belongs_to :user

  scope :extract_by_category, -> (category_id) { where(category_id: category_id).limit(10).order("created_at DESC") }

end