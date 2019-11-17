class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :last_name, presence: true, length: { maximum: 15 }
  validates :first_name, presence: true, length: { maximum: 15 }
  validates :last_furigana, presence: true, length: { maximum: 20 }
  validates :first_furigana, presence: true, length: { maximum: 20 }
  validates :postal_code, presence: true, length: { maximum: 7 }
  validates :address, presence: true, length: { maximum: 70 }
  validates :phone_number, presence: true, length: { maximum: 15 }
  validates :email, presence: true
  #validates :password, presence: true, length: { minimum: 6 }
  #validates :password_confirmation, presence: true, length: { minimum: 6 }


  has_many :contacts
  has_many :orders
  has_many :addresses, inverse_of: :user
  accepts_nested_attributes_for :addresses, reject_if: :all_blank, allow_destroy: true
  has_many :favorites
  has_many :cart_items
  has_many :reviews
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
acts_as_paranoid
#acts_as_paranoidとは? データを論理削除するためのプラグイン

end