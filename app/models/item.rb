class Item < ApplicationRecord
  acts_as_paranoid
  enum status: { "販売中": 0, "販売停止中": 1 }

  has_many :songs
  has_many :arrivals
  has_many :favorites
  has_many :item_orders
  has_many :reviews
  belongs_to :cart_item
  belongs_to :artist
  belongs_to :category
  belongs_to :label
end
