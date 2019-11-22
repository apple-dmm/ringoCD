class AddOrderIdToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :order_id, :integer
  end
end
