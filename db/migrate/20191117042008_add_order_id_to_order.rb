class AddOrderIdToOrder < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :order_id, :integer
    add_column :addresses, :address_id, :integer
  end
end
