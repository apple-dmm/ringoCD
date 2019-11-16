class Artist < ApplicationRecord
	has_many :items
	accepts_nested_attributes_for :items

	scope :autocomplete, ->(term) {
		 where("name LIKE ?", "#{term}%").order(:name)
	}
end
