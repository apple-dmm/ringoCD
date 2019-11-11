class Order < ApplicationRecord
  enum status: { "クレジット": 0, "銀行振込": 1, "代引": 2 }
  enum status: { "未受付": 0, "受付済": 1, "出荷準備中": 2, "出荷済": 3, "配送済": 4 }

  has_many :item_orders
  belongs_to :end_user
end
