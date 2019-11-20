class ItemOrder < ApplicationRecord
	belongs_to :item
	belongs_to :order
acts_as_paranoid
end
