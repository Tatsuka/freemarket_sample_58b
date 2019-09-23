class Category < ApplicationRecord
  has_many :brands, through: :categories_brands
  has_many :items
  # has_ancestry
end
