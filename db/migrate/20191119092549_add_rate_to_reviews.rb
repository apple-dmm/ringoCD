class AddRateToReviews < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :rate, :float
    remove_column :reviews, :valuation, :integer
  end
end
