class Arrival < ApplicationRecord
	belongs_to :item

	validates :arrival_quantity, presence: true
	validates :arrival_date, presence: true
	validates :item_id, presence: true
end
