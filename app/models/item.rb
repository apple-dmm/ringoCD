class Item < ApplicationRecord
  acts_as_paranoid
  enum status: { "販売中": 0, "販売停止中": 1 }

  has_many :arrivals
  has_many :favorites
  has_many :favorited_users, through: :favorites, source: :user
  has_many :item_orders
  has_many :orders, through: :item_orders
  has_many :reviews
  has_many :cart_item
  belongs_to :artist
  belongs_to :category
  belongs_to :label

  def favorited_by?(user)
    self.favorites.where(user_id: user.id).exists?
  end

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

  def sales_status_change_to_1
    update_attributes(status: 1)
  end

  def sales_status_change_to_0
    update_attributes(status: 0)
  end

  def total_arrival_calculate
    total_arrival = 0
    self.arrivals.each do |arrival|
      total_arrival += arrival.arrival_quantity
    end
    return total_arrival
  end

    def total_item_order_calculate
    total_item_order = 0
    self.item_orders.each do |item_order|
      total_item_order += item_order.quantity
    end
    return total_item_order
  end


end
