class Favorite < ApplicationRecords
	belongs_to :end_user
	belongs_to :item
end
