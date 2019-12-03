class Category < ApplicationRecord
	has_many :items

	validates :name, presence: true

	scope :autocomplete, ->(term) {
	 where("name LIKE ?", "#{term}%").order(:name)
}
end
