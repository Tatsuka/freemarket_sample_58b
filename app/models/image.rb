class Image < ApplicationRecord
  belongs_to :item
  # mount_uploder :image, Imageuploder
end