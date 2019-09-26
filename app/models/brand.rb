class Brand < ApplicationRecord
  has_many :categories , through: :categories_brands
end
