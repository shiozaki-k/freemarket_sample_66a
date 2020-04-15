class Product < ApplicationRecord
  enum status: { sale: 0, trade: 1, sold: 2 }
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true
  validates_associated :images
  validates :images, presence: true
  validates :name, length: { maximum: 40 }, presence: true
  validates :description, length: { maximum: 1000 }, presence: true
  validates :price, :condition, :category, :shipping_fee, :shipping_origin, :shipping_duration, presence: true
  # belongs_to :user
end
