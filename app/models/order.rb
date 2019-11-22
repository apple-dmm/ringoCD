class Order < ApplicationRecord
  enum payment: { "クレジット": 0, "銀行振込": 1, "代引": 2 }
  enum delivery_status: { "未受付": 0, "受付済": 1, "出荷準備中": 2, "出荷済": 3, "配送済": 4 }

  has_many :item_orders
  has_many :items,through: :item_orders
  belongs_to :user
  accepts_nested_attributes_for :item_orders, allow_destroy: true
acts_as_paranoid
end
