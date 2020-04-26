class Image < ApplicationRecord
  mount_uploader :src, ImageUploader
  validates :src, presence: true
  belongs_to :product
  # belongs_to :items
end
