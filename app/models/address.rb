class Address < ApplicationRecord
  validates :postal_code, presence: true
  validates :prefectures, presence: true
  validates :city_name, presence: true 
  validates :street_number, presence: true


  
  belongs_to :user
end
