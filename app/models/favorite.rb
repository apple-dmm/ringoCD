class Favorite < ApplicationRecords
	belongs_to :user
	belongs_to :item
end
