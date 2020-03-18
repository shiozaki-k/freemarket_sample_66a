class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, password_length: 7..128


  has_many :items
  has_many :orders
  has_many :comments
  has_many :creditcards
  has_one :address
  accepts_nested_attributes_for :address

end
