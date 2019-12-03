class Artist < ApplicationRecord
	has_many :items
	accepts_nested_attributes_for :items

	validates :name, presence: true

	scope :autocomplete, ->(term) {
		 where("name LIKE ?", "#{term}%").order(:name)
	}
end
