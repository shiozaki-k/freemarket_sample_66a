class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, password_length: 7..128
  
  validates :nickname, presence: true
  validates :last_name, presence: true, format: {with: /\A[一-龥ぁ-ん]/}
  validates :first_name, presence: true, format: {with: /\A[一-龥ぁ-ん]/}
  validates :last_furigana, presence: true, format: {with: /\A[ぁ-んー－]+\z/}
  validates :first_furigana, presence: true, format: {with: /\A[ぁ-んー－]+\z/}
  validates :birth_year, presence: true
  validates :birth_month, presence: true
  validates :birth_day, presence: true
  validates :phone_number, format: {with: /\A\d{10,11}\z/}
 



  has_many :items
  has_many :orders
  has_many :comments
  has_many :creditcards
  has_one :address
  accepts_nested_attributes_for :address

end
