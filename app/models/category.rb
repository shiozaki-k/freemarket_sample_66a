class Category < ApplicationRecord
  has_many :products
  has_ancestry
  has_many :bookmarks
  has_many :users, through: :bookmarks
end
