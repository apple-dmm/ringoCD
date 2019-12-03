class Disk < ApplicationRecord
	belongs_to :item
	has_many :songs, inverse_of: :disk
	accepts_nested_attributes_for :songs, reject_if: :all_blank, allow_destroy: true

	validates :disk_num, presence: true
end
