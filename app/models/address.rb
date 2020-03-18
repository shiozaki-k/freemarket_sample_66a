class Address < ApplicationRecord
  # validates :postal_code, presence: true, format: {with: /\A\d{3}[-]\d{4}$|^\d{3}[-]\d{2}$|^\d{3}$|^\d{5}$|^\d{7}\z/}
  # validates :prefectures, presence: true
  # validates :city_name, presence: true 
  # validates :street_number, presence: true


  
  belongs_to :user
end
