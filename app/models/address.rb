class Address < ApplicationRecord
  validates :last_name_ad, presence: true, format: {with: /\A[一-龥ぁ-ん]/}
  validates :first_name_ad, presence: true, format: {with: /\A[一-龥ぁ-ん]/}
  validates :last_furigana_ad, presence: true, format: {with: /\A[ぁ-んー－]+\z/}
  validates :first_furigana_ad, presence: true, format: {with: /\A[ぁ-んー－]+\z/}
  validates :postal_code, presence: true
  validates :prefectures, presence: true
  validates :city_name, presence: true 
  validates :street_number, presence: true

  
 

  
  belongs_to :user
end
