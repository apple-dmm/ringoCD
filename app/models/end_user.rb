class EndUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :favorites
  has_many :contacts
  has_many :orders
  has_many :addresses
  has_many :reviews
  has_one :cart_item

  acts_as_paranoid
end
