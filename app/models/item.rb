class Item < ApplicationRecord
  acts_as_paranoid
  enum status: { "販売中": 0, "販売停止中": 1 }

  has_many :arrivals
  has_many :favorites
  has_many :item_orders
  has_many :orders, through: :item_orders
  has_many :reviews
  has_many :cart_item
  belongs_to :artist
  belongs_to :category
  belongs_to :label

  attachment :image

  has_many :disks, inverse_of: :item
  #親要素のレコード時に、子要素のレコードも同時に行う。allow_destroyで子要素の削除を許可している。
  accepts_nested_attributes_for :disks, reject_if: :all_blank, allow_destroy: true

  validates :name, presence: true
  validates :price, presence: true
  validates :release, presence: true

  def include_tax_price
    (price * 1.1).round(0) 
  end
end
