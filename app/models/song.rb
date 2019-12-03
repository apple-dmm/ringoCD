class Song < ApplicationRecord
	belongs_to :disk

	validates :setlist, presence: true
	validates :name, presence: true
end
