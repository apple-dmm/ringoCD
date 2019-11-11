class CreateArrivals < ActiveRecord::Migration[5.2]
  def change
    create_table :arrivals do |t|
    	t.integer :item_id
    	t.integer :arrival_quantity
    	t.datetime :arrival_date

      t.timestamps
    end
  end
end
